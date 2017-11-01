class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
    	t.belongs_to :flight, foreign_key: true
    	
      t.timestamps
    end
  end
end
