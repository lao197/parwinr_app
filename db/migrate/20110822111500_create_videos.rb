class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.string :videoID
      t.string :videoType

      t.timestamps
    end
    add_index :videos, :videoID, :unique => true
    add_index :videos, :videoType
  end

  def self.down
    drop_table :videos
  end
end
