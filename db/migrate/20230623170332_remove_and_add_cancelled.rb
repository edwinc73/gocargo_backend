class RemoveAndAddCancelled < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :canceled, :boolean
    add_column :bookings, :cancelled, :boolean
  end
end
