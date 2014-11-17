class CreateFriends < ActiveRecord::Migration
  def self.up
    create_table :friends do |t|
      t.integer :my_id
      t.integer :friend_id
      t.string :friend_type

      t.timestamps
    end
  end

  def self.down
    drop_table :friends
  end
end
