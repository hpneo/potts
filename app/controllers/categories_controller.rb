class CategoriesController < ApplicationController

  def index
    @categories = current_user.categories
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @projects = Project.all
    @category = Category.new(:user_id => current_user.id)
  end

  def edit
    @projects = Project.all
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params[:category])
    @category.user_id = current_user.id
    @category.save
    redirect_to category_path(@category)
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(params[:category])
    redirect_to category_path(@category)
  end

end
