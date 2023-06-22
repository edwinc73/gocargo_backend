json.extract! @user, :username, :avatar_image, :rating, :email, :id

json.favourite_cars do
  json.array! @favourite_cars do |car|
    json.extract! car, :car_model, :mileage, :car_image, :city, :price_per_day, :rating, :id
  end
end

json.bookings do
  json.array! @bookings do |booking|
    json.extract! booking, :start_date, :return_date, :total_price, :completed, :user_rating, :car_rating, :car, :id
  end
end

json.cars do
  json.array! @cars do |car|
    json.extract! car, :car_model, :mileage, :car_image, :city, :price_per_day, :rating, :id
  end
end
