class CreateSegments < ActiveRecord::Migration
  def self.up
    create_table :segments do |t|
      t.integer :startTime
      t.integer :endTime
      t.integer :game_id

#      t.timestamps
    end
    add_index :segments, :game_id
  end

  def self.down
    drop_table :segments
  end
end
