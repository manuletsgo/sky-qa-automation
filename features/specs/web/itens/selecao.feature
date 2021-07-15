#language: pt

Funcionalidade: Seleção

    @selecionar_item
    Cenário: Selecionar item
      Dado que esteja na home
      Quando acessar o item "Programação"
      Então deverá ser exibida a página do item "Programação"
