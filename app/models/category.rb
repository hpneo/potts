class Category < ActiveRecord::Base

  has_many :tasks
  has_and_belongs_to_many :users
  accepts_nested_attributes_for :users

  def project
    Project.find(self.project_id) if self.project_id
  end

  def to_param
    if name
      "#{id}-#{name.parameterize}"
    else
      super
    end
  end

  def load_stories
    if self.project_id
      self.project.stories.each do |story|
        Task.create({
          :category_id => self.id,
          :title => story.name.to_s.force_encoding("UTF-8"),
          :status => story.current_state.to_s,
          :story_id => story.id.to_s,
          :story_type => story.story_type.to_s
        })
      end
    end
  end

end
