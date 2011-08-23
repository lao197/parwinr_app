class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :username
      t.string :encryptedPassword
      t.string :salt
      t.string :accountType
      t.integer :points
      t.integer :level

      t.timestamps
    end
    add_index :users, :firstName
    add_index :users, :lastName
    add_index :users, :email, :uniqeu => true
    add_index :users, :username, :uniqeu => true
  end

  def self.down
    drop_table :users
  end
end
