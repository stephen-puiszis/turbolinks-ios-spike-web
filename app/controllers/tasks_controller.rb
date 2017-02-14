class TasksController < ApplicationController

  before_action :authenticate_user!
  before_action :assign_and_authorize_tasks
  before_action :assign_and_authorize_task, only: [:edit, :update, :destroy]

  def index

  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    @task.save

    redirect_to tasks_path(@task)
  end

  def update
    @task.update_attributes(task_params)
    redirect_to tasks_path(@task)
  end

  def destroy
    @task.destroy
    redirect_To tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end

  def assign_and_authorize_task
    @task = current_user.tasks.find(params[:id])
  end

  def assign_and_authorize_tasks
    @tasks = current_user.tasks
  end

end
