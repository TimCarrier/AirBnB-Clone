class UsersController < ApplicationController
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
    flash[:notice] = "User was successfully destroyed." if @user.destroy
    redirect_to root_path
  end

  private
  def set_user
    params.require(:user).permit(:email, :username, :first_name, :last_name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
