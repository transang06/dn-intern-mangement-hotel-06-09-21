class UsersController < ApplicationController
  before_action :load_user, only: [:show]

  def show; end

  private

  def user_params
    params.require(:user)
          .permit :last_name, :first_name, :email, :phone,
                  :password, :password_confirmation,
                  :date_of_birth
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t "users.nil"
    redirect_to root_path
  end
end
