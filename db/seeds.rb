# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "cleaning DB"

User.destroy_all

puts "DB preparation"
puts "creating Users"

User.new(first_name: "Joanna",
        last_name: "Pink",
        email: "joanna@example.com",
        password: 123456,
        biography: "Owning a farm with chickens has been a fulfilling adventure. The joy of tending to the land and witnessing
        the daily egg-laying miracles is truly rewarding."
        )

10.times do
  User.new(first_name: Faker::Beer.brand,
          last_name: Faker::Color.color_name,
          email: Faker::Internet.email,
          password: 123456,
          biography: Faker::Quotes::Shakespeare.as_you_like_it_quote
          )
end


puts "creating Chickens"

20.times do
  Chicken.new(age: rand(1..10),
              breed: ["Andalusian", "Brahma", "Brakel", "Dutch Bantam", "Hamburgh"].sample,
              egg_capacity: rand(1..5),
              gender: Faker::Gender.binary_type,
              noise_level: ["low", "medium", "high"].sample,
              description: Faker::Coffee.notes
              )
end

puts "👩🏻‍🦳👨🏿‍🦱 and 🐔 have been sucessfuly created "
