class AddDefaultValueToTasks < ActiveRecord::Migration
  def self.up
    change_column :tasks, :status, :string, :default => 'unscheduled'
  end

  def self.down
  end
end
