class CreateFavouriteCars < ActiveRecord::Migration[7.0]
  def change
    create_table :favourite_cars do |t|
      t.references :user, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end
