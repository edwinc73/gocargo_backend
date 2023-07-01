class AddIsFavouritedToFavouriteCarsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :favourite_cars, :is_favourited, :boolean, default: false
  end
end
