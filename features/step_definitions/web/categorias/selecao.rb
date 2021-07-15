Quando("acessar o item {string}") do |item|
  @main_header = @home.main_header
  @main_header.acessar_item(item)
  @item = $web_pages.item
end

Então("deverá ser exibida a página do item {string}") do |item|
  expect(@item.breadc_item.text).to eql item
  expect(@item).to have_current_path /#{item.tr('çã', 'ca')}/i
end
