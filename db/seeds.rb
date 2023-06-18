FavouriteCar.destroy_all
Booking.destroy_all
Car.destroy_all
User.destroy_all

30.times do
  username = Faker::Internet.username(specifier: 5..18)
  email = Faker::Internet.email
  avatar = ['dogs', 'sports', 'cars'].sample
  avatar_image = Faker::LoremFlickr.image(size: "100x100", search_terms: [avatar])
  User.create!(username: username, email: email, avatar_image: avatar_image)
end

100.times do
  car_brand = Faker::Vehicle.make
  model = Faker::Vehicle.model(make_of_model: car_brand)
  car_model = "#{car_brand} #{model}"
  car_image = "https://cdn.imagin.studio/getimage?customer=img&make=#{car_brand}&modelFamily=#{model}&angle=1&paintId=2t"
  mileage = rand(1..100000)
  city = ["Beijing", "Shanghai", "Shenzhen", "Xian", "Guangzhou", "Chongiqng", "Chengdu", "Hangzhou", "Nanjing"].sample
  price_per_day = rand(200..3000).round(2)
  Car.create!(
    car_model: car_model,
    car_image: car_image,
    mileage: mileage,
    city: city,
    price_per_day: price_per_day,
    user: User.all.sample
  )
end

50.times do
  FavouriteCar.create!(user: User.all.sample, car: Car.all.sample)
end

50.times do
  start_date = Faker::Time.between(from: DateTime.now, to: '2023-07-06')
  return_date = Faker::Time.between(from: start_date, to: '2023-07-06')
  price_per_day = Car.all.sample.price_per_day
  total_price = ((return_date - start_date) / 1.day).ceil * price_per_day
  Booking.create!(
    start_date: start_date,
    return_date: return_date,
    user: User.all.sample,
    car: Car.all.sample,
    total_price: total_price,
    completed: false,
    approved: false
  )
end
