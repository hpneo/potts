class CategoriesController < InheritedResources::Base

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
    if params[:load_from_pivotal]
      if @category.project_id
        @category.project.stories.each do |story|
          Task.create({
            :category_id => @category.id,
            :title => story.name.to_s.force_encoding("UTF-8"),
            :status => story.current_state.to_s,
            :story_id => story.id.to_s,
            :story_type => story.story_type.to_s
          })
        end
      end
    end
    redirect_to category_path(@category)
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
