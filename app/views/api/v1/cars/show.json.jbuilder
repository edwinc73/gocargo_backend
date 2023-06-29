json.car do
  json.extract! @car, :car_model,:car_brand,:mileage, :car_image, :city, :price_per_day, :rating, :id, :description
end

json.photos @car.photos.map {|photo| photo.url}

json.owner do
  json.extract! @owner, :username, :avatar_image, :rating, :id
end
