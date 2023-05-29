# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "cleaning DB"

User.destroy_all

puts "DB preparation"
puts "creating Users"

10.times User.new(first_name:
                  last_name:
                  email:
                  password:
                  biography:
                  )


puts "creating Chickens"

20.times

puts "👩🏻‍🦳👨🏿‍🦱 and 🐔 have been sucessfuly created "
