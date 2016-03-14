class AddIndextoUser < ActiveRecord::Migration
  def change
    add_index :users, :avatar
  end
end
