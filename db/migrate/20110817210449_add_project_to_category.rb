class AddProjectToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :project_id, :string
  end

  def self.down
    remove_column :categories, :project_id
  end
end
