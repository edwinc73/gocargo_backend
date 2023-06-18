50.times do
  FavouriteCar.create!(user_id: rand(1..30), car_id: rand(1..100))
end

50.times do
  start_date = Faker::Time.between(from: DateTime.now, to: '2023-07-06')
  return_date = Faker::Time.between(from: start_date, to: '2023-07-06')
  user_id = rand(1..30)
  car_id = rand(1..100)
  price_per_day = Car.find(car_id).price_per_day
  total_price = ((return_date - start_date) / 1.day).ceil * price_per_day
  Booking.create!(
    start_date: start_date,
    return_date: return_date,
    user_id: user_id,
    car_id: car_id,
    total_price: total_price,
    completed: false,
    approved: false
  )
end