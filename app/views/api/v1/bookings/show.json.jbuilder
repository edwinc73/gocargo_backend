json.booking do
  json.startdate  @booking.start_date.strftime("/%y/%m/%d")
  json.returndate  @booking.return_date.strftime("/%y/%m/%d")
  json.extract! @booking, :approved, :completed, :cancelled, :start_date, :return_date, :total_price, :user_rating, :car_rating, :id
end

json.car do
  json.extract! @car, :car_model, :mileage, :car_image, :city, :price_per_day, :rating, :id
end

json.renter do
  json.extract! @renter, :username, :avatar_image, :rating, :id
end

json.owner do
  json.extract! @owner, :username, :avatar_image, :rating, :id
end
