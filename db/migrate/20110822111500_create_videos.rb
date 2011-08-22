class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.string :videoID
      t.string :type

      t.timestamps
    end
    add_index :videos, :videoID
  end

  def self.down
    drop_table :videos
  end
end
