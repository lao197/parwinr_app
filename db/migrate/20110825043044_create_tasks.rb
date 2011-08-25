class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :taskType
      t.text :xmlContent
      t.integer :user_id

      t.timestamps
    end
    add_index :tasks, :user_id
  end

  def self.down
    drop_table :tasks
  end
end
