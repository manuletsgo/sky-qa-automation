require_relative '../../sections/headers/main_header.rb'

module Web
  module Pages
    module Home
      class Home < SitePrism::Page
        set_url '/'

        section :main_header, Web::Sections::Headers::MainHeader, '.nav-main.container .navbar-collapse'

        element :btn_close_modal, '.close'

        def close_modal
          has_btn_close_modal?
          kill_popups
        end

      end
    end
  end
end
