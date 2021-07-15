module Web
  module Pages
    module Canais
      class Canal < SitePrism::Page

        element :input_canal, '#searchChannel'
        element :span_lista_canais, '.btn-title-no-background'
        elements :spans_result_canais, '.list-channel-detail li[style=""] div.col-sm-7 p'

        def buscar_canal(canal)
          input_canal.greenify
          input_canal.send_keys canal
        end

      end
    end
  end
end
