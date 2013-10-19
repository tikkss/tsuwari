class CreateEatings < ActiveRecord::Migration
  def change
    create_table :eatings do |t|
      t.references :health_record, index: true
      t.references :food, index: true
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
