class ChangeMileageTypeInCars < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :mileage, :integer
    add_column :cars, :mileage, :float
  end
end
