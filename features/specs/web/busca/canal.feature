#language: pt

Funcionalidade: Canais

  @buscar_canal
  Cenário: Buscar canal
    Dado que esteja na página do item "Programação"
    Quando acessar lista de canais
    E buscar por "Disney"
    Então deverá ser exibido o resultado da busca "Disney"
