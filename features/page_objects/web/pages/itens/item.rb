module Web
  module Pages
    module Itens
      class Item < SitePrism::Page

        element :breadc_item, '.btn-breadcrumb'

        element :span_lista_canais, '.btn-title-no-background'

        def acessar_lista_canais
          span_lista_canais.gclick
        end

      end
    end
  end
end
