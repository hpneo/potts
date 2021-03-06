class TasksController < ApplicationController

  def new
    @category = Category.find(params[:category_id])
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
    @task.category_id = params[:category_id]
    if @task.save
      @task.post_to_pivotal
      redirect_to category_task_path(params[:category_id], @task)
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(params[:task])
    unless @task.story_id.to_s.empty?
      story = Story.find(@task.story_id)
      story.update_attributes(:name => @task.title, :project_id => @task.category.project_id, :description => @task.comments, :current_state => @task.status)
    end

    respond_to{ |format|
      format.html { redirect_to category_task_path(@task.category, @task) }
      format.js
    }
  end

  def show
    @category = Category.find(params[:category_id])
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    unless @task.story_id.to_s.empty?
      story = Story.find(@task.story_id)
      story.destroy(:project_id => @task.category.project_id)
    end
  end

end
