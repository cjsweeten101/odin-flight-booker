class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.datetime :start
      t.datetime :end
      t.references :from_airport
      t.references :to_airport

      t.timestamps
    end
  end
end
