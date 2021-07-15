Quando("acessar lista de canais") do
  @item.acessar_lista_canais
  @canal = $web_pages.canal
end

Quando("buscar por {string}") do |canal|
  @canal.buscar_canal(canal)
end

Então("deverá ser exibido o resultado da busca {string}") do |canal|
  @canal.spans_result_canais.each do |result_canal|
    expect(result_canal.text).to have_content /#{canal}/i
    result_canal.greenify
  end
end
