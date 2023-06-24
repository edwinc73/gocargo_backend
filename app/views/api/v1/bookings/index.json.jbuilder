json.booking_owner do
  json.array! @booking_owner do |booking|
    json.date  booking.start_date.strftime("/%y/%m/%d")
    json.date  booking.return_date.strftime("/%y/%m/%d")
    json.extract! booking, :approved, :completed, :start_date, :return_date, :total_price, :user_rating, :car_rating, :id, :car, :user
  end
end

json.booking_renter do
  json.array! @booking_renter do |booking|
    json.date  booking.start_date.strftime("/%y/%m/%d")
    json.date  booking.return_date.strftime("/%y/%m/%d")
    json.extract! booking, :approved, :completed, :start_date, :return_date, :total_price, :user_rating, :car_rating, :id, :car, :user
  end
end
