json.booking do
<<<<<<< HEAD
  json.startdate  @booking.start_date.strftime("/%y/%m/%d")
  json.returndate  @booking.return_date.strftime("/%y/%m/%d")
  json.extract! @booking, :approved, :completed, :cancelled, :start_date, :return_date, :total_price, :user_rating, :car_rating, :id
=======
  json.start_date  @booking.start_date.strftime("%y/%m/%d")
  json.return_date  @booking.return_date.strftime("%y/%m/%d")
  json.extract! @booking, :approved, :completed, :total_price, :user_rating, :car_rating, :id
>>>>>>> eb944130dbfd33aeea2fd9b437474d971f41346a
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
