class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "users.welcome"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user)
          .permit :last_name, :first_name, :email, :phone,
                  :password, :password_confirmation,
                  :date_of_birth
  end
end
