class AddEatingUniqueIndex < ActiveRecord::Migration
  def change
    add_index :eatings, [:health_record_id, :food_id], unique: true
  end
end
