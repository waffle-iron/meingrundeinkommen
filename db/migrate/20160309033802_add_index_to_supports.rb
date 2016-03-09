class AddIndexToSupports < ActiveRecord::Migration
  def change
    add_index :supports, :user_id
  end
end
