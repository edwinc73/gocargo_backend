json.booking do
  json.start_date  @booking.start_date.strftime("%Y-%m-%d")
  json.return_date  @booking.return_date.strftime("%Y-%m-%d")
  json.extract! @booking, :approved, :cancelled, :completed, :total_price, :user_rating, :car_rating, :id
end

json.car do
  json.extract! @car, :car_model, :car_brand, :mileage, :car_image, :city, :price_per_day, :rating, :id, :user_id
  json.photos @car.photos.map {|photo| photo.url}
end

json.renter do
  json.extract! @renter, :username, :avatar_image, :rating, :id
end

json.owner do
  json.extract! @owner, :username, :avatar_image, :rating, :id
end
