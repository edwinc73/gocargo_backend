json.booking_owner do
  json.array! @booking_owner do |booking|
    json.start_date  booking.start_date.strftime("%Y-%m-%d")
    json.return_date  booking.return_date.strftime("%Y-%m-%d")
    json.extract! booking, :cancelled, :approved, :completed, :total_price, :user_rating, :car_rating, :id, :car, :user
  end
end

json.booking_renter do
  json.array! @booking_renter do |booking|
    json.start_date  booking.start_date.strftime("%Y-%m-%d")
    json.return_date  booking.return_date.strftime("%Y-%m-%d")
    json.extract! booking, :cancelled, :approved, :completed, :total_price, :user_rating, :car_rating, :id, :car, :user
  end
end
