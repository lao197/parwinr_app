class AddUserToVideo < ActiveRecord::Migration
  def self.up
    add_column :videos, :user_id, :integer
    add_index :videos, :user_id
  end

  def self.down
    remove_column :videos, :user_id
    remove_index :videos, :user_id
  end
end
