class ChangeCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :mileage, :float
    remove_column :cars, :mileage, :integer
  end
end
