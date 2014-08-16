class AddIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,         unique: true
  end
end
