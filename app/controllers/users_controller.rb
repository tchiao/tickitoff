class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def update
  end

  def show
    @user = User.find(params[:id])
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