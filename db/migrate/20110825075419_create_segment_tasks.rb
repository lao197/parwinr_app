class CreateSegmentTasks < ActiveRecord::Migration
  def self.up
    create_table :segment_tasks do |t|
      t.integer :segment_id
      t.integer :task_id

#      t.timestamps
    end
    add_index :segment_tasks, :segment_id
    add_index :segment_tasks, :task_id
    add_index :segment_tasks, [:segment_id, :task_id], :unique => true
  end

  def self.down
    drop_table :segment_tasks
  end
end
