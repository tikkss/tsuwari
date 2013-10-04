class CreateFoodTastes < ActiveRecord::Migration
  def change
    create_table :food_tastes do |t|
      t.references :food, index: true
      t.references :taste, index: true

      t.timestamps
    end
  end
end
