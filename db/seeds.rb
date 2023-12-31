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
  car_image: "https://res.cloudinary.com/dj2vij3ty/image/upload/v1688196478/pexels-photo-337909_adlgsz.jpg",
  description: "Rent a stunning Ferrari Spider 348 with a sleek design and top-of-the-line features. Don't miss out on this rare opportunity."
}

porsche = {
  car_brand: "Porsche",
  model: "911 GT",
  car_image: "https://res.cloudinary.com/dj2vij3ty/image/upload/v1688196465/Porsche_911_992_GT3_hcly6s.jpg",
  description: "Experience the thrill of driving a legendary sports car with a used Porsche 911 GT. With its powerful engine and agile handling, this car is perfect for a weekend getaway or a special event."
}

koenigsegg = {
  car_brand: "Koenigsegg",
  model: "Gemera GT",
  car_image: "https://res.cloudinary.com/dj2vij3ty/image/upload/v1688196270/Koenigsegg-Gemera-in-motion-3_fxhjxl.webp",
  description: "Rent the Koenigsegg Gemera GT for an unforgettable driving experience. This used sports car features a powerful engine and state-of-the-art technology, perfect for a luxurious weekend getaway."
}

aston_martin = {
  car_brand: "Aston Martin",
  model: "Valkyrie 2015",
  car_image: "https://res.cloudinary.com/dj2vij3ty/image/upload/v1688196269/aston-martin-valkyrie-2023-36_0_pwz0it.webp",
  description: "Sleek and powerful Aston Martin for rent - a stylish choice for discerning drivers. Experience the James Bond connection with this iconic and luxurious ride."
}

mclaren = {
  car_brand: "Mclaren",
  model: "Senna #434",
  car_image: "https://res.cloudinary.com/dj2vij3ty/image/upload/v1688196270/2019_mclaren_senna_img_7358-6-64343_coouee.webp",
  description: "Experience the unmatched performance of my McLaren. This hypercar combines exquisite design with exhilarating speed, creating the ultimate driving experience for enthusiasts."
}

lamborghini = {
  car_brand: "Lamborghini",
  model: "Huracan LP570",
  car_image: "https://images.pexels.com/photos/10394779/pexels-photo-10394779.jpeg",
  description: "Experience the sheer thrill and unmatched performance of this iconic supercar. Its captivating design and exhilarating power make it the ultimate choice for discerning drivers."
}

bugatti = {
  car_brand: "Bugatti",
  model: "Bolide",
  car_image: "https://res.cloudinary.com/dj2vij3ty/image/upload/v1688196271/bugatti-bolide-106-1628792006_gjml1p.jpg",
  description: "Discover the epitome of speed and excitement with my Bugatti Bolide. This extraordinary vehicle pushes the boundaries of performance, delivering breathtaking power and an unforgettable driving experience."
}

maserati = {
  car_brand: "Maserati",
  model: "MC20",
  car_image: "https://res.cloudinary.com/dj2vij3ty/image/upload/v1688196275/c6d161ec51_lizdxd.jpg",
  description: "As an owner of the Maserati MC20, I can confidently say that this car is a masterpiece of engineering and design. Its advanced technology and pure power create an unrivaled driving experience that you won't find anywhere else."
}

premium_car = [ferrari, porsche, mclaren, aston_martin, koenigsegg, lamborghini, bugatti, maserati]

100.times do
  car = premium_car.sample
  car_brand = car[:car_brand]
  description = car[:description]
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
    description: description,
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

puts "finished seeding"
