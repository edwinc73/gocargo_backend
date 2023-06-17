class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :return_date
      t.integer :total_price
      t.boolean :completed
      t.boolean :approved
      t.float :user_rating
      t.float :car_rating
      t.references :user, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end
