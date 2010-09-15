class CreateComments < ActiveRecord::Migration
  def self.up
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
  end
end
