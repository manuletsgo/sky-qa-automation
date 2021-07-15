module PageHelper
  module KillModals
    def self.kill_modals
      Capybara.page.execute_script(
        "
        window.addEventListener('load', function () {
          $('.close').click();
          $('.modal-close').click();
        }, false);
        "
      )
    end

    def kill_popups
      puts 'Killing poop ups 💩'
      Capybara.page.execute_script(
        "
          $('.close').click();
        "
      )
    end
  end
end
