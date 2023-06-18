# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

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
  user_id = rand(1..30)
  Car.create!(
    car_model: car_model,
    car_image: car_image,
    mileage: mileage,
    city: city,
    price_per_day: price_per_day,
    user_id: user_id
  )
end

50.times do
  FavouriteCar.create!(user_id: rand(1..30), car_id: rand(1..100))
end

50.times do
  start_date = Faker::Time.between(from: DateTime.now, to: '2023-07-06')
  return_date = Faker::Time.between(from: start_date, to: '2023-07-06')
  user_id = rand(1..30)
  car_id = rand(1..100)
  price_per_day = Car.find(car_id).price_per_day
  total_price = ((return_date - start_date)/1.day).ceil * price_per_day
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
