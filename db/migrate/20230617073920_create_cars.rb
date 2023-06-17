class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :car_model
      t.integer :mileage
      t.string :car_image
      t.string :city
      t.float :price_per_day
      t.float :rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
