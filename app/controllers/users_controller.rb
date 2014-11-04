class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path
    else
      flash[:error] = "Invalid user information"
      redirect_to edit_user_registration_path
    end
  end

  def show
    @user = current_user
    # @user = User.find(params[:id])
    if @user.list
      @list = @user.list
    else
      @list = List.new
    end

  end

  private
  def user_params
    params.require(:user).permit(:name)
  end

end