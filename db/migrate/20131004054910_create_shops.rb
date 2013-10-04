class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :prefecture
      t.string :city
      t.string :address
      t.string :url
      t.integer :category_id

      t.timestamps
    end
  end
end
