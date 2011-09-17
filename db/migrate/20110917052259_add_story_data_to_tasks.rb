class AddStoryDataToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :story_id, :string
    add_column :tasks, :story_type, :string
    add_column :tasks, :current_state, :string
  end

  def self.down
    remove_column :tasks, :current_state
    remove_column :tasks, :story_type
    remove_column :tasks, :story_id
  end
end
