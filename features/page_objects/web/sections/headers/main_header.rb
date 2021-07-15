module Web
  module Sections
    module Headers
      class MainHeader < SitePrism::Section

        elements :itens, ' .menu-link .nav-item'

        def acessar_item(i)
          clicadas=0
          itens.each do |it|
            if (it.text.match(/#{i}/i))
              it.gclick
              clicadas+=1
              break
            end
          end
          raise("ERRO: Item não encontrado") if clicadas == 0
        end

      end
    end
  end
end

