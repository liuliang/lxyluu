class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :title, :default=>nil
        t.string :avatar_file_name, :default=>nil
        t.string :avatar_content_type, :default=>nil
        t.string :avatar_file_size, :default =>nil
        t.string :avatar_update_at, :default =>nil
        t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
