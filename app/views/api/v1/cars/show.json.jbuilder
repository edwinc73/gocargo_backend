json.car do
  json.extract! @car, :car_model,:mileage, :car_image, :city, :price_per_day, :rating, :id
end

json.owner do
  json.extract! @owner, :username, :avatar_image, :rating, :id
end
