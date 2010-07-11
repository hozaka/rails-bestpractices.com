class AddFormattedHtmlToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :formatted_html, :text
  end

  def self.down
    remove_column :comments, :formatted_html
  end
end
