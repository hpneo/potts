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

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(params[:task])
    story = Story.find(@task.story_id)
    story.update_attributes(:name => self.title, :project_id => self.category.project_id, :description => self.comments, :current_state => self.status)
  end

  def show
    @category = Category.find(params[:category_id])
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    story = Story.find(@task.story_id)
    story.destroy(:project_id => self.category.project_id)
  end

end
