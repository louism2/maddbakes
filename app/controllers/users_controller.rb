class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_parameters)
    if @user.save
      flash[:success] = "You up in it girl!"
      redirect_to @user     
    else
      flash[:error] = "Boo, fix these errors or else!"
      render 'new'
    end
  end
  
  def show
    
  end

private

  def user_parameters
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :access_code)
  end

end
