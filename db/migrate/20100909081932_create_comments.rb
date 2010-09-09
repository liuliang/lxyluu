class CreateComments < ActiveRecord::Migration
  def self.up
    add_column :blogs,:weight,:integer,:default=>0
    add_column :blogs,:view,:integer,:default=>0
    create_table :comments do |t|
      t.string :user_name, :default=> nil
      t.string :user_email, :default=>nil
      t.string :user_home, :default=>nil
      t.string :content, :default=>nil
      t.integer :blog_id
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
    remove_column :blogs,:weight
    remove_column :blogs,:view
  end
end
