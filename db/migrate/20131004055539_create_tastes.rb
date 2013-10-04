class CreateTastes < ActiveRecord::Migration
  def change
    create_table :tastes do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :tastes, :name, unique: true
  end
end
