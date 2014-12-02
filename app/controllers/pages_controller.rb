class PagesController < ApplicationController
  
  def home
    @posts = Post.home_page_query
  end
  
end
