class AddIndexToPayments < ActiveRecord::Migration
  def change
    add_index :payments, :user_id
  end
end
