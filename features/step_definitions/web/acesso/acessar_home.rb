Dado("que esteja na home") do
  @home = $web_pages.home
  @home.load
  @home.close_modal
end
