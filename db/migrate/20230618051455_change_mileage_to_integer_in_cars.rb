class ChangeMileageToIntegerInCars < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :mileage, :float
    add_column :cars, :mileage, :integer
  end
end
