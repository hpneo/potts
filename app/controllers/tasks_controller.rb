class TasksController < ApplicationController

  def new
    @category = Category.find(params[:category_id])
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
    @task.category_id = params[:category_id]
    if @task.save
      redirect_to category_task_path(params[:category_id], @task)
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(params[:task])
  end

  def show
    @category = Category.find(params[:category_id])
    @task = Task.find(params[:id])
  end

end
