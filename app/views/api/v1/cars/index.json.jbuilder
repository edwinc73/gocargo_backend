json.cars do
  json.array! @cars do |car|
    json.extract! car, :car_model, :mileage, :car_image, :city, :price_per_day, :rating, :id
    json.photos do
      json.array! car.photos do |photo|
        json.extract! photo.url
      end
    end
  end
end
