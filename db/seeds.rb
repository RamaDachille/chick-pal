# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"

Booking.destroy_all
Chicken.destroy_all
User.destroy_all

# geochicken = Chicken.new(age: 5, breed: "Andalusian", egg_capacity: 4, gender: "male", noise_level: "low", user_id: 22, description: "Test 123", price: 15, name: "Test Chicken", address: "Rudi-Dutschke-Straße 26, 10969 Berlin")
chicken_descriptions = [
  "Meet Henrietta, a charming hen with a striking combination of black and white feathers. She's a friendly and sociable chicken that loves to explore the backyard.",
  "Introducing Nugget, a plump and golden-brown chicken with a heartwarming personality. She enjoys sunbathing and scratching the soil for delicious treats.",
  "Clara is a beautiful silkie chicken with soft and fluffy white feathers. She's known for her gentle nature and makes for a perfect companion in the garden.",
  "Say hello to Maximus, a regal rooster with vibrant multicolored plumage. He struts around the coop with confidence and adds a touch of elegance to any flock.",
  "Penelope is a graceful and elegant hen with feathers in shades of brown and gold. She's an excellent egg layer and will provide you with farm-fresh eggs every morning.",
  "Meet Coco, a curious and adventurous chicken with speckled black and white feathers. She loves to roam freely and is always on the lookout for exciting discoveries.",
  "Benny is a friendly and affectionate rooster with a vibrant red comb and majestic tail feathers. He's a natural alarm clock, ensuring you wake up with his crowing.",
  "Lucy is a fluffy and cuddly chicken with beautiful golden feathers. She enjoys human companionship and will happily perch on your shoulder while you relax.",
  "Introducing Ginger, a striking ginger-colored hen with a playful personality. She loves to scratch the ground and is an expert bug hunter in the garden.",
  "Say hello to Elvis, a rockstar rooster with jet-black feathers and a stylish comb. He loves to entertain with his lively crowing and will steal the show every time.",
  "Penny is a petite and dainty hen with stunning black and white polka-dot feathers. She's a little shy but quickly warms up to gentle care and attention.",
  "Meet Spike, a handsome and protective rooster with glossy dark feathers and a strong build. He'll keep a watchful eye over the flock and ensure their safety.",
  "Daisy is a sweet and docile hen with beautiful yellow feathers and a gentle demeanor. She's an excellent choice for families and will quickly become a beloved pet.",
  "Introducing Maverick, a bold and fearless rooster with striking blue and green iridescent feathers. He's the leader of the flock and commands respect from his companions.",
  "Coco is a stunning chocolate-colored hen with a friendly personality. She enjoys dust bathing and will keep your garden pest-free with her diligent foraging.",
  "Say hello to Oliver, a handsome and regal rooster with luxurious white feathers. He's a great protector and will ensure the safety of his hens at all times.",
  "Lily is a delightful and sociable hen with beautiful black and white striped feathers. She's an excellent choice for a backyard flock and gets along well with other chickens.",
  "Introducing Rocky, a robust and resilient rooster with rugged brown feathers and a fierce attitude. He's a true guardian and will protect the coop from intruders.",
  "Pumpkin is a lovely hen with warm orange feathers and a friendly disposition. She's an expert at finding hidden treats and loves to share her discoveries with the flock.",
  "Meet Jasper, a striking rooster with a combination of vibrant red, green, and blue feathers. He's a real showstopper and will add a touch of glamour to your backyard.",
]

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
                        description: chicken_descriptions.sample,
                        price: rand(10..100),
                        name: Faker::Creature::Dog.name,
                        address: ["Goerzallee 189, 14167 Berlin, Germany", "Billy-Wilder-Promenade 49, 14167 Berlin, Germany", "Glinkastraße 20, 10117 Berlin, Germany", "Seegefelder Str. 12, 13597 Berlin, Germany", "Ruppiner Chaussee 351, 13503 Berlin, Germany", "Bisonweg 155, 13503 Berlin, Germany", "Koenigsallee, 14193 Berlin, Germany", "Leipziger Straße, 10117 Berlin, Germany"].sample
                        )
  final_chicken = create_pics(images[i], chicken.name, chicken)
  final_chicken.save!
end

puts "👩🏻‍🦳👨🏿‍🦱 and 🐔 have been sucessfuly created "
