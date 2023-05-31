# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"

puts "cleaning DB"

User.destroy_all

puts "DB preparation"
puts "creating Users"

joanna = User.new(first_name: "Joanna",
                  last_name: "Pink",
                  email: "joanna@example.com",
                  password: 123456,
                  biography: "Owning a farm with chickens has been a fulfilling adventure. The joy of tending to the land and witnessing
                  the daily egg-laying miracles is truly rewarding."
                  )
joanna.save!

10.times do
  user = User.new(first_name: Faker::Beer.brand,
          last_name: Faker::Color.color_name,
          email: Faker::Internet.email,
          password: 123456,
          biography: Faker::Quotes::Shakespeare.as_you_like_it_quote
          )
  user.save!
end
puts "creating Chickens"

def create_pics(url, file_name, chicken)
  file = URI.open(url)
  chicken.photo.attach(io: file, filename: file_name, content_type: "image/png")
  return chicken
end

images = ["https://res.cloudinary.com/dn6tphmik/image/upload/v1685527668/CHICKENS/ANDALUSIAN/Andalusian-Chicken_Pegasene_Shutterstock-1_pbo0pj.jpg",
          "https://res.cloudinary.com/dn6tphmik/image/upload/v1685527668/CHICKENS/ANDALUSIAN/Andalusian1_zwdnxr.jpg",
          "https://res.cloudinary.com/dn6tphmik/image/upload/v1685527668/CHICKENS/ANDALUSIAN/Andalusian_Chicken_koqgqd.jpg",
          "https://res.cloudinary.com/dn6tphmik/image/upload/v1685527668/CHICKENS/ANDALUSIAN/Andalusian-rooster_o1azee.jpg",
          "https://res.cloudinary.com/dn6tphmik/image/upload/v1685526153/CHICKENS/BRAHMA/Screenshot_2023-05-30_at_17.23.42_z2cufr.png",
          "https://res.cloudinary.com/dn6tphmik/image/upload/v1685526153/CHICKENS/BRAHMA/Screenshot_2023-05-30_at_17.23.53_xajmqa.png",
          "https://res.cloudinary.com/dn6tphmik/image/upload/v1685526153/CHICKENS/BRAHMA/Screenshot_2023-05-30_at_17.21.25_ncy9me.png",
          "https://res.cloudinary.com/dn6tphmik/image/upload/v1685526153/CHICKENS/BRAHMA/Screenshot_2023-05-30_at_17.24.12_vsucn1.png",
          "https://res.cloudinary.com/dn6tphmik/image/upload/v1685527669/CHICKENS/BRAKEL/Braekel_zwerg_teq3ej.png",
          "https://res.cloudinary.com/dn6tphmik/image/upload/v1685527669/CHICKENS/BRAKEL/Goldbrakel_2021-06-08_David_Selbert__38__xf7fqb.jpg",
          "https://res.cloudinary.com/dn6tphmik/image/upload/v1685527669/CHICKENS/BRAKEL/zbrakel-gold1_td34vn.jpg",
          "https://res.cloudinary.com/dn6tphmik/image/upload/v1685527669/CHICKENS/BRAKEL/Braekel-Bantams-Chickens-for-sale_xam6yo.jpg",
          "https://res.cloudinary.com/dn6tphmik/image/upload/v1685526692/CHICKENS/DUTCH%20BANTHAM/Screenshot_2023-05-30_at_17.32.30_fq1tfa.png",
          "https://res.cloudinary.com/dn6tphmik/image/upload/v1685526692/CHICKENS/DUTCH%20BANTHAM/Screenshot_2023-05-30_at_17.31.47_uc1p5m.png",
          "https://res.cloudinary.com/dn6tphmik/image/upload/v1685526691/CHICKENS/DUTCH%20BANTHAM/Screenshot_2023-05-30_at_17.33.24_elluqt.png",
          "https://res.cloudinary.com/dn6tphmik/image/upload/v1685526691/CHICKENS/DUTCH%20BANTHAM/Screenshot_2023-05-30_at_17.31.11_llaz5v.png",
          "https://res.cloudinary.com/dn6tphmik/image/upload/v1685527638/CHICKENS/HAMBURGER/Screenshot_2023-05-30_at_17.34.53_ihs8mq.png",
          "https://res.cloudinary.com/dn6tphmik/image/upload/v1685527637/CHICKENS/HAMBURGER/Screenshot_2023-05-30_at_17.42.29_qgqx5p.png",
          "https://res.cloudinary.com/dn6tphmik/image/upload/v1685527637/CHICKENS/HAMBURGER/Screenshot_2023-05-30_at_17.36.31_jwqbkk.png",
          "https://res.cloudinary.com/dn6tphmik/image/upload/v1685527637/CHICKENS/HAMBURGER/Screenshot_2023-05-30_at_17.37.29_bpb9sa.png"]

20.times do |i|
  chicken = Chicken.new(age: rand(1..10),
                        user_id: User.pluck(:id).sample,
                        breed: ["Andalusian", "Brahma", "Brakel", "Dutch Bantam", "Hamburgh"].sample,
                        egg_capacity: rand(1..5),
                        gender: ["female", "male"].sample,
                        noise_level: ["low", "medium", "high"].sample,
                        description: Faker::Coffee.notes,
                        price: rand(10..100),
                        name: Faker::Dessert.topping
                        )
  final_chicken = create_pics(images[i], chicken.name, chicken)
  final_chicken.save!
end

puts "👩🏻‍🦳👨🏿‍🦱 and 🐔 have been sucessfuly created "
