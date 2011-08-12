class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.integer :category_id
      t.string :title
      t.text :comments
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
