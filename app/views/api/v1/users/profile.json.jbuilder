json.extract! @user, :username, :avatar_image, :rating, :email, :id

json.favourite_cars do
  json.array! @favourite_cars do |car|
    json.extract! car, :car_model, :mileage, :car_image, :city, :price_per_day, :rating, :id, :description
    json.photos car.photos.map {|photo| photo.url}
  end
end

json.cars do
  json.array! @cars do |car|
    json.extract! car, :car_model, :mileage, :car_image, :city, :price_per_day, :rating, :id, :description
    json.photos do
      json.array! car.photos do |photo|
        json.extract! photo.url
      end
    end
  end
end
