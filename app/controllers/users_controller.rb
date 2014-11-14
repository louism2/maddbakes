class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.create(user_parameters)
    if @user
      flash[:error] = "Boo, fix these errors or else!"
      redirect_to @user
    else
      flash[:success] = "You up in it girl!"
      render 'new'
    end
  end

private

  def user_parameters
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
