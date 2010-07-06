class AddFormattedHtmlToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :formatted_html, :text
  end

  def self.down
    remove_column :posts, :formatted_html
  end
end
