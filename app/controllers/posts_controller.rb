class PostsController < ApplicationController
  
  before_action :authenticate_request, except: [:show]
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_parameters)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to @post
    else
      flash[:error] = "Boo, check yo self"
      render 'new'
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
  
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
private

  def post_parameters
    params.require(:post).permit(:content, photos_attributes: [:image_file])
  end
  
end