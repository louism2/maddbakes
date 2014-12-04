class PagesController < ApplicationController
  
  def home
    @posts = Post.post_previews
  end
  
end
