class AddDaysInBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :days, :integer
  end
end
