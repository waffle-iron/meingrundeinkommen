class AddIndexToStateUsers < ActiveRecord::Migration
  def change
    add_index :state_users, :state_id
  end
end
