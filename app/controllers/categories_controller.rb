class CategoriesController < InheritedResources::Base

  def index
    @categories = current_user.categories
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @projects = Project.all
    @category = Category.new
    @category.users.build
    new!
  end

  def edit
    #@projects = Project.all
    @category = Category.find(params[:id])
    @category.users.build
    edit!
  end

  def create
    users = params[:category][:users_attributes]
    params[:category][:users_attributes] = []
    create!{
      current_user.categories << @category

      if users
        users.each do |index, user|
          @category.users << User.find(user[:id])
        end
      end

      @category.load_stories if params[:load_from_pivotal]
      category_path(@category)
    }
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(params[:category])
    redirect_to category_path(@category)
  end

  def destroy
    destroy!{ root_path }
  end

end
