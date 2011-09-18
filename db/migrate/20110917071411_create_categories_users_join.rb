class CreateCategoriesUsersJoin < ActiveRecord::Migration
  def self.up
    create_table 'categories_users', :id => false do |t|
      t.column :category_id, :integer
      t.column :user_id, :integer
    end
  end

  def self.down
    drop_table 'categories_users'
  end
end
