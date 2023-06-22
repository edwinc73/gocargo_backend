json.bookings do
  json.array! @bookings do |booking|
    json.extract! booking, :approved, :completed, :start_date, :return_date, :total_price, :user_rating, :car_rating, :id, :car, :user
  end
end
