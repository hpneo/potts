class Category < ActiveRecord::Base

  has_many :tasks
  belongs_to :user

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

end
