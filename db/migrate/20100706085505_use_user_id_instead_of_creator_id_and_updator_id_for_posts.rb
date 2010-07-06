class UseUserIdInsteadOfCreatorIdAndUpdatorIdForPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :user_id, :integer
    remove_column :posts, :creator_id
    remove_column :posts, :updater_id
  end

  def self.down
  end
end
