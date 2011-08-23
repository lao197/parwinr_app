class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :title
      t.text :description
      t.decimal :rating, :default => 0, :precision => 3, :scale => 2
      t.integer :totalRating, :default => 0
      t.integer :noOfRating, :default => 0
      t.integer :likes, :default => 0
      t.integer :user_id
      t.integer :video_id

      t.timestamps
    end
    add_index :games, :title
    add_index :games, :description
    add_index :games, :user_id
    add_index :games, :video_id
  end

  def self.down
    drop_table :games
  end
end
