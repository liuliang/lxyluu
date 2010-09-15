class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_table :blogs do |t|
      t.string :title, :default => nil
      t.text :content, :default => nil
      t.integer :user_id
      t.integer :blog_category_id     
      t.boolean :is_private, :default=>false
      t.integer :weight,:default=>0
      t.integer :view,:default=>0
      t.string :tags, :default=>nil
      t.integer :flag, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :blogs
  end
end
