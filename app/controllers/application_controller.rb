class ApplicationController < ActionController::Base

  include Session, PostsHelper
  
  protect_from_forgery with: :exception
  
private 
  
  def authenticate_request
    unless signed_in?
      flash[:error] = "You must be signed in to access the application!"
      redirect_to sign_in_path()    
    end
  end

end
