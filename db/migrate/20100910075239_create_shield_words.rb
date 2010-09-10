class CreateShieldWords < ActiveRecord::Migration
  def self.up
    create_table :shield_words do |t|
      t.string :name,:default=>nil
      t.timestamps
    end
  end

  def self.down
    drop_table :shield_words
  end
end
