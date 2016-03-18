class CreateCrowdbars < ActiveRecord::Migration
  def change
    create_table :crowdbars do |t|
      t.float   :total_commission
      t.integer :referal_count
      t.float   :seven_day_commission
      t.integer :seven_day_referal_count

      t.timestamps
    end
  end
end
