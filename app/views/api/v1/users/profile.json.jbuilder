json.extract! @user, :username, :avatar_image, :rating, :email
json.favourite_cars do
  json.array! @favourite_cars do |car|
    json.extract! car, :car_model, :mileage, :car_image, :city, :price_per_day, :rating
  end
end
