class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_table :blogs do |t|
      t.string :title, :default => nil
      t.text :content, :default => nil
      t.integer :flag, :default => 0
      t.integer :blog_category_id
      t.string :tags, :default=>nil
      t.boolean :is_private, :default=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :blogs
  end
end
