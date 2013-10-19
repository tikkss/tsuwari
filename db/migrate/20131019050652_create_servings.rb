class CreateServings < ActiveRecord::Migration
  def change
    create_table :servings do |t|
      t.integer :shop_id
      t.integer :food_id

      t.timestamps
    end
    add_index :servings, :shop_id
    add_index :servings, [:shop_id, :food_id], unique: true
  end
end
