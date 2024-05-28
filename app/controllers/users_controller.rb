class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :new, status: 422
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :first_name, :last_name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
