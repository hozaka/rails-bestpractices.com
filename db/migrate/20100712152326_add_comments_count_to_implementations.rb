class AddCommentsCountToImplementations < ActiveRecord::Migration
  def self.up
    add_column :implementations, :comments_count, :integer, :default => 0
  end

  def self.down
    remove_column :implementations, :comments_count
  end
end
