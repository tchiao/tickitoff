class ListsController < ApplicationController
  respond_to :html, :js

  def create
    @list = List.new(list_params)
    @user = current_user
    @list.user = current_user

    if @list.save
      flash[:notice] = "List was saved"
      redirect_to list_path(@list)
    else
      flash[:error] = "There was a problem saving your list."
      render :new
    end
  end

  def show
    @list = List.friendly.find(params[:id])
    @tasks = @list.tasks.all
    @task = @list.tasks.new
  end

  def edit
    @list = List.friendly.find(params[:id])
  end

  def update
    @list = List.friendly.find(params[:id])

    if @list.update_attributes(list_params)
      flash[:notice] = "List updated."
    else
      flash[:error] = "Oops, there was a problem updating the list. Try again."
    end

    respond_with(@list) do |format|
      format.html { redirect_to profile_path }
    end

  end


  def destroy
    @list = List.friendly.find(params[:id])
    if @list.destroy
      flash[:notice] = "\"#{@list.name}\" was deleted."
      redirect_to profile_path
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
