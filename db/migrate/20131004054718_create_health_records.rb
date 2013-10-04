class CreateHealthRecords < ActiveRecord::Migration
  def change
    create_table :health_records do |t|
      t.date :date
      t.integer :time_period
      t.integer :health

      t.timestamps
    end
  end
end
