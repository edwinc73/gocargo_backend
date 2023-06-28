require "json"
require "open-uri"

FavouriteCar.destroy_all
Booking.destroy_all
Car.destroy_all
User.destroy_all

30.times do
  username = Faker::Internet.username(specifier: 5..18)
  email = Faker::Internet.email
  rating = rand(3.0..5.0).round(1)
  avatar = ['dogs', 'sports', 'cars'].sample
  avatar_image = Faker::LoremFlickr.image(size: "100x100", search_terms: [avatar])
  User.create!(username: username, email: email, avatar_image: avatar_image, rating: rating)
end

ferrari = {
  car_brand: "Ferrari",
  model: "spider 348",
  car_image: "https://images.pexels.com/photos/337909/pexels-photo-337909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
}

porsche = {
  car_brand: "Porsche",
  model: "911 GT",
  car_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Porsche_911_992_GT3.jpg/1200px-Porsche_911_992_GT3.jpg"
}

koenigsegg = {
  car_brand: "Koenigsegg",
  model: "Gemera GT",
  car_image: "https://www.motortrend.com/uploads/sites/11/2020/03/Koenigsegg-Gemera-in-motion-3.jpg?fit=around%7C875:492"
}

aston_martin = {
  car_brand: "Aston Martin",
  model: "Valkyrie 2015",
  car_image: "https://www.autocar.co.uk/sites/autocar.co.uk/files/styles/gallery_slide/public/aston-martin-valkyrie-2023-36_0.jpg?itok=BeIgNQix"
}

mclaren = {
  car_brand: "Mclaren",
  model: "Senna #434",
  car_image: "https://bringatrailer.com/wp-content/uploads/2023/02/2019_mclaren_senna_img_7358-6-64343.jpg?fit=940%2C627"
}

lamborghini = {
  car_brand: "Lamborghini",
  model: "Huracan LP570",
  car_image: "https://images.pexels.com/photos/10394779/pexels-photo-10394779.jpeg"
}

bugatti = {
  car_brand: "Bugatti",
  model: "Bolide",
  car_image: "https://hips.hearstapps.com/hmg-prod/images/bugatti-bolide-106-1628792006.jpg?crop=0.922xw:1.00xh;0.0450xw,0&resize=980:*"
}

premium_car = [ferrari, porsche, mclaren, aston_martin, koenigsegg, lamborghini, bugatti]

100.times do
  car = premium_car.sample
  car_brand = car[:car_brand]
  model = car[:model]
  rating = rand(1.0..5.0).round(1)
  car_image = car[:car_image]
  mileage = rand(1..473)
  city = ["Beijing", "Shanghai", "Shenzhen", "Xian", "Guangzhou", "Chongiqng", "Chengdu", "Hangzhou", "Nanjing"].sample
  price_per_day = rand(500..3000).round(2)
  car = Car.create!(
    car_model: model,
    car_brand: car_brand,
    car_image: car_image,
    mileage: mileage,
    city: city,
    rating: rating,
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
  car_rating = rand(3.0..5.0).round(1)
  user_rating = rand(3.0..5.0).round(1)
  days = ((return_date - start_date) / 1.day).ceil
  total_price = days * price_per_day
  Booking.create!(
    start_date: start_date,
    return_date: return_date,
    user: User.all.sample,
    car: Car.all.sample,
    total_price: total_price,
    completed: false,
    approved: false,
    cancelled: false,
    days: days,
    car_rating: car_rating,
    user_rating: user_rating
  )
end
