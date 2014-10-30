class ListsController < ApplicationController

  def create
    @list = List.new(list_params)
    @user = current_user
    @list.user = current_user

    if @list.save
      flash[:notice] = "List was saved"
      redirect_to single_list_path
    else
      flash[:error] = "There was a problem saving your list."
      render :new
    end
  end

  def show
    @list = current_user.list
    @tasks = @list.tasks.all
    @task = @list.tasks.new
  end

  def destroy
    @list = current_user.list
    if @list.destroy
      flash[:notice] = "\"#{@list.name}\" was deleted."
      redirect_to current_user
    else
      flash[:error] = "There was an error deleting your list."
      render :show
    end
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
