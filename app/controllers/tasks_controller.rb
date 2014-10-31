class TasksController < ApplicationController
  respond_to :html, :js

  def create
    @list = current_user.list
    @tasks = @list.tasks
    @task = current_user.tasks.build(task_params)
    @task.list = @list
    @new_task = Task.new

    if @task.save
      flash[:notice] = "Task saved!"
    else
      flash[:error] = "Sorry, there was a problem saving your task."
    end

    respond_with(@task) do |format|
      format.html { redirect_to single_list_path }
    end
  end

  def edit
    @list = current_user.list
    @task = @list.tasks.find(params[:id])
  end

  def update
    @list = current_user.list
    @task = @list.tasks.find(params[:id])

    if @task.update_attributes(task_params)
      flash[:notice] = "Task updated."
    else
      flash[:error] = "Oops, there was a problem updating the task. Try again."
    end

    respond_with(@task) do |format|
      format.html { redirect_to single_list_path }
    end

  end

  def destroy
    @list = current_user.list
    @task = @list.tasks.find(params[:id])

    if @task.destroy
      flash[:notice] = "\"#{@task.description}\" was completed. Go you!"

    else
      flash[:error] = "Oops, there was a problem completing the task. Try again."
    end

    respond_with(@task) do |format|
      format.html { redirect_to single_list_path }
    end

  end

  private

  def task_params
    params.require(:task).permit(:description)
  end

end
