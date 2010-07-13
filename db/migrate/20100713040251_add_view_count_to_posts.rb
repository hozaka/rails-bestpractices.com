class AddViewCountToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :view_count, :integer
  end

  def self.down
    remove_column :posts, :view_count
  end
end
