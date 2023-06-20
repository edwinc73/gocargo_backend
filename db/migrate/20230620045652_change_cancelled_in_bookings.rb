class ChangeCancelledInBookings < ActiveRecord::Migration[7.0]
  def change
    def change
      remove_column :bookings, :canceled, :boolean
      add_column :bookings, :cancelled, :boolean
    end
  end
end
