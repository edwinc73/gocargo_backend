json.bookings do
  json.array! @bookings do |booking|
    json.extract! booking, :approved, :completed, :total_price,:total_price, :user_rating, :car_rating, :id, :car, :user
  end
