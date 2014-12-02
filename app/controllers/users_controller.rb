class UsersController < ApplicationController
  
  before_action :authenticate_request, except: [:new, :create]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_parameters)
    if @user.save
      sign_in(@user)
      flash[:success] = "You up in it girl!"
      redirect_to @user   
    else
      flash[:error] = "Boo, fix these errors or else!"
      render 'new'
    end
  end
  
  def show
    @current_user
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_parameters)
      sign_in(@user)
      flash[:success] = "Straight Updating!"
      redirect_to @user
    else
      flash[:error] = "Boo, errors boo."
      render 'edit'
    end
  end

private

  def user_parameters
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :access_code)
  end

end
