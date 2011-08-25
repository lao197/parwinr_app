class CreateGameposts < ActiveRecord::Migration
  def self.up
    create_table :gameposts do |t|
      t.text :text
      t.integer :likes, :default => 0
      t.integer :user_id
      t.integer :game_id

      t.timestamps
    end
    add_index :gameposts, :user_id
    add_index :gameposts, :game_id
  end

  def self.down
    drop_table :gameposts
  end
end
