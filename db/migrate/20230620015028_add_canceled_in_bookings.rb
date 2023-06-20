class AddCanceledInBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :canceled, :boolean
  end
end
