Dir[File.join(File.dirname(__FILE__), 'spec_helper/*.rb')]
  .sort.each { |file| require file }

$web_pages = Web::Pages::WebPages
$project_root = File.expand_path(File.join(File.dirname(__FILE__), '/../..'))

features_root = File.join($project_root, '/features')
page_helpers_root = File.join(features_root, '/support/page_helpers')
page_objects_root = File.join(features_root, '/page_objects', "#{APP}")

$LOAD_PATH << features_root
$LOAD_PATH << page_helpers_root
$LOAD_PATH << page_objects_root

require 'report_builder'
require 'support/page_helpers/js_usable_injector.rb'
require 'support/page_helpers/kill_modals.rb'

def timestamp
  date = Time.now.strftime('%Y%m%d').to_s
  time = Time.now.strftime('%H-%M-%S').to_s
  "#{date}_#{time}"
end

RUN_TSTAMP = timestamp.freeze
RUN_DIR = "reports/screenshots/#{RUN_TSTAMP}/".freeze
$screenshot_counter = 1

def normalize_file_name(file_name = '')
  file_name
    .to_s
    .gsub(/[^0-9A-Za-z_\-]/, '_')
    .gsub(/_{2,}/, '_')
    .gsub(/_$/, '')
    .downcase
end

def class_name(object)
  object.class.name.split('::').last
end

def status_from_result(result)
  class_name result
end

def take_screenshot(file_name = '', status = :passed)
  file_extension = '.png'
  file_name_normalized = normalize_file_name file_name
  status_normalized = normalize_file_name status

  file_name_prefix = $screenshot_counter.to_s + status_normalized + (
    file_name_normalized.empty? ? '' : '_'
  )

  file_path = RUN_DIR + file_name_prefix + file_name_normalized + file_extension

  Capybara.page.save_screenshot(file_path)
  embed(file_path, 'image/png')

  $screenshot_counter += 1
end


AfterStep do |result, step|
  begin
    status_name = status_from_result result
    take_screenshot(step.text, status_name)
  rescue StandardError => exception
    puts exception
  end
end

After do |scenario|
  if scenario.failed?
    take_screenshot('failed', 'failed')
  end
  if !ISPARALLELRUNNING
    Capybara.reset_session!
    Capybara.current_session.driver.quit
  end
  clear_reports
end

at_exit do
  ReportBuilder.build_report
end

def clear_reports
  files = Dir.glob('reports/*')
  time = RUN_TSTAMP[0..-4]
  files.each do |file|
    unless file.match(/#{time}/) || file.match(/screenshots/) || file.match(/sky-automation-report/)
      FileUtils.remove_file(file, force = true)
    end
  end
  clear_screenshots
end

def clear_screenshots
  files = Dir.glob('reports/screenshots/*')
  time = RUN_TSTAMP[0..-4]
  files.each do |file|
    unless file.match(/#{time}/)
      FileUtils.remove_dir(file, force = true)
    end
  end
end

if ISPARALLELRUNNING
  require 'parallel_tests'
  # preparation:
  # affected by race-condition: first process may boot slower than the second
  # either sleep a bit or use a lock for example File.lock
  ParallelTests.first_process? ? sleep(10) : sleep(1)

  at_exit do
    if ParallelTests.first_process?
      ParallelTests.wait_for_other_processes_to_finish
      Capybara.current_session.driver.quit
    end
  end
end
