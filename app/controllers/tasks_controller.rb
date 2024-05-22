class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def about
    @task = Task.find(params[:id])
  end

  def new
    @tasks = Task.new
  end

  def create
    @tasks = Task.new(tasks_params)
    @tasks.save
    redirect_to tasks_path(@tasks)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @tasks = Task.find(params[:id])
    @tasks.update(tasks_params)
    redirect_to tasks_path(@tasks)
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :details)
  end
end
