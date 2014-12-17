class PostsController < ApplicationController
  
  include Session
  
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
    @comment = Comment.new
  end
  
  def edit
  
  end
  
  def update
    post = Post.find(params[:id])
    if post.update_attributes(post_parameters)
      redirect_to post
    else
      render 'edit'
    end  
  end
  
  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = "Get. That. Shit. OUT!!!!!"
      redirect_to root_path
    else
      @comment = Comment.new
      flash[:error] = "There was an error and the post wasn't destroyed.  Try again"
      render 'show'
    end
  end
  
private

  def post_parameters
    params.require(:post).permit(:content, photos_attributes: [:image_file, :id, :header_photo, :_destroy])
  end
  
end
