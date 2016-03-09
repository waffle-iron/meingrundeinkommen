class AddIndexToCrowdcards < ActiveRecord::Migration
  def change
    add_index :crowdcards, :user_id
  end
end
