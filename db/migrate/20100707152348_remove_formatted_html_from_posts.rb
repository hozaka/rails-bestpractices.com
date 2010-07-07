class RemoveFormattedHtmlFromPosts < ActiveRecord::Migration
  def self.up
    remove_column :posts, :formatted_html
  end

  def self.down
  end
end
