class ApplicationController < ActionController::Base

  include Session, PostsHelper, PhotosHelper
  
  protect_from_forgery with: :exception
  
private 
  
  # called in each controller
  def authenticate_request
    unless signed_in?
      flash[:error] = "You must be signed in to access the application!"
      redirect_to sign_in_path()    
    end
  end

end
