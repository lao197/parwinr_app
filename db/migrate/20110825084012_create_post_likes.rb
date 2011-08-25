class CreatePostLikes < ActiveRecord::Migration
  def self.up
    create_table :post_likes do |t|
      t.integer :user_id
      t.integer :gamepost_id

#      t.timestamps
    end
    add_index :post_likes, :gamepost_id
    add_index :post_likes, [:user_id, :gamepost_id], :unique => true
  end

  def self.down
    drop_table :post_likes
  end
end
