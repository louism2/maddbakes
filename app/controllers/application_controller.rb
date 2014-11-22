class ApplicationController < ActionController::Base

  include Session
  
  protect_from_forgery with: :exception
  
  before_filter :authenticate_user
  
  
  def authenticate_user
    unless signed_in? || safe_pages?
      flash[:error] = "You must be signed in to access the application!"
      redirect_to sign_in_path()    
    end
  end
  
private  
  
  def safe_pages?
    controller = params[:controller]
    action = params[:action]
    return false if controller.eql('users') && !safe_user_actions.include?(action) 
    controller.eql('sessions') && !safe_session_actions.include?(action) ? false : true
  end
  
  def safe_session_actions
    ['new','create','destroy']
  end
  
  def safe_user_actions
    ['new','create']
  end
  
end
