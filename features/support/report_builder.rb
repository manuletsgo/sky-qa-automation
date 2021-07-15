require 'report_builder'

time = Time.now.getutc
time.localtime

ReportBuilder.configure do |config|
  config.encoding = 'utf-8'
  config.input_path = 'reports/'
  config.report_path = 'reports/sky-automation-report'
  config.report_types = [:html]
  config.report_title = 'SKY'
  config.color = 'red'
  config.additional_css = 'features\support\css_report_builder.css'
  config.additional_info = {
    Browser: 'Chrome',
    'Project' => 'SKY',
    'Version' => 'Desktop',
    'Environment' => 'PROD',
    'Automation Engineer' => 'Emanuele A. Marques',
    'Report date' => "#{time.strftime('%d/%m/%Y')} - #{time.strftime('%k:%M')}"
  }
end
