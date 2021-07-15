require_relative 'simple_js_runnable.rb'

module PageHelper
  module Greenable
    include SimpleJsRunnable

    def greenify
      js("self.setAttribute('style','border: 3px solid #15a50d')")
    end

    def gclick
      greenify
      click
    end

    def gset(value)
      greenify
      set ''
      set value
    end

    def sclick(_file_name = '', _result = 'passed')
      greenify
      click
    end
  end

  module Showable
    include SimpleJsRunnable

    def scroll_into_view
      js('self.scrollIntoView();')
    end
  end

  module Settable
    include SimpleJsRunnable

    def set_value_with_mask(value)
      jquery("self.val('#{value}').trigger('keyup')")
    end
  end

  module JsUsableElement
    include Greenable
    include Showable
    include Settable
  end
end
