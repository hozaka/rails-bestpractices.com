class CreateImplementations < ActiveRecord::Migration
  def self.up
    create_table :implementations do |t|
      t.integer :post_id
      t.integer :user_id
      t.text :body
      t.text :formatted_html

      t.timestamps
    end
  end

  def self.down
    drop_table :implementations
  end
end
