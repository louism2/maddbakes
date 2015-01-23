module PagesHelper
  
  def add_placeholder
    '<div id="header_placeholder"></div>'.html_safe if controller.class != PagesController
  end
  
end
