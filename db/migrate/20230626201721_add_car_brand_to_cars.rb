class AddCarBrandToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :car_brand, :string
  end
end
