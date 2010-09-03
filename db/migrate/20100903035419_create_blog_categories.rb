class CreateBlogCategories < ActiveRecord::Migration
  def self.up
    create_table :blog_categories do |t|
      t.string :name, :default=>nil
      t.string :rmark, :default=>nil
      t.integer :flag, :default=>0,:limit=>1
      t.timestamps
    end
  end

  def self.down
    drop_table :blog_categories
  end
end
