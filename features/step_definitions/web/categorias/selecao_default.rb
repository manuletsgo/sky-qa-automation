Dado("que esteja na página do item {string}") do |item|
  steps %{
    Dado que esteja na home
    Quando acessar o item "#{item}"
    Então deverá ser exibida a página do item "#{item}"
  }
end
