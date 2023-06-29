json.car do
  json.extract! @car, :car_model,:car_brand,:mileage, :car_image, :city, :price_per_day, :rating, :id
end
json.photos do
  json.array! @car.photos do |photo|
    json.extract! photo.blob, :key, :filename
  end
end

json.owner do
  json.extract! @owner, :username, :avatar_image, :rating, :id
end
