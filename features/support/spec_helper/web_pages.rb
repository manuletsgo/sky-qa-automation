Dir[File.join(File.dirname(__FILE__), 'page_objects/web/pages/*.rb')]
  .sort.each { |file| require file }

module Web
  module Pages
    class WebPages
      class << self
        def home
          Web::Pages::Home::Home.new
        end

        def item
          Web::Pages::Itens::Item.new
        end

        def canal
          Web::Pages::Canais::Canal.new
        end
      end
    end
  end
end
