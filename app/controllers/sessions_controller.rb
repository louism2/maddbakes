class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = authenticate_with_email_and_password(params[:email], params[:submitted_password]) 
    if user
      flash[:success] = "Welcome back.  Get that money"
      sign_in(user)
      redirect_to root_path  
    else
      flash[:error] = "You ain't the real bitch"
      render 'new'
    end
  end
  
  def destroy
    
  end
  
end
