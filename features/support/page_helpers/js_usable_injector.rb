require_relative 'simple_js_runnable.rb'
require_relative 'js_usable_element.rb'
require_relative 'kill_modals.rb'

module Capybara
  module Node
    class Element
      def root_element
        self
      end

      include PageHelper::JsUsableElement
    end
  end
end

module SitePrism
  class Section
    include PageHelper::JsUsableElement
  end

  class Page
    include PageHelper::KillModals
  end
end
