30.times do
  username = Faker::Internet.username(specifier: 5..18)
  email = Faker::Internet.email
  avatar = ['dogs', 'sports', 'cars'].sample
  avatar_image = Faker::LoremFlickr.image(size: "100x100", search_terms: [avatar])
  User.create!(username: username, email: email, avatar_image: avatar_image)
end

100.times do
  car_brand = Faker::Vehicle.make
  car_model = Faker::Vehicle.model(make_of_model: car_brand)
  car_image = "https://cdn.imagin.studio/getimage?customer=img&make=#{car_brand}&modelFamily=#{car_model}&angle=1&paintId=2t"
  mileage = rand(1.0..100000.0).round(1)
  city = ["Beijing", "Shanghai", "Shenzhen", "Xian", "Guangzhou", "Chongiqng", "Chengdu", "Hangzhou", "Nanjing"].sample
  price_per_day = rand(200..10000).round(2)
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
