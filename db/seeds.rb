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
  "A friendly chicken with a striking combination of feathers, always ready to explore the backyard and make new friends.",
  "A hilarious companion with a unique plumage and a mischievous sense of humor, brightening up the coop with laughter and funny antics.",
  "A delightful and loving chicken, known for its affectionate nature and vibrant personality, spreading warmth in the backyard.",
  "A charismatic superstar of the chicken world, commanding attention with its confident presence and fabulousness in the coop.",
  "A playful prankster, always up to mischief and ready to playfully tease others, keeping the backyard entertained with clever tricks.",
  "A fabulous and fashion-forward chicken, setting trends with its stylish feathers and turning the coop into a runway of fashion.",
  "A sassy and occasionally mean chicken with a sharp beak, keeping others on their toes and adding a touch of attitude to the coop.",
  "A sweetheart with a gentle and loving nature, bringing warmth to the flock with cuddles and spreading love throughout the backyard.",
  "A feathered entertainer, the life of the party with witty jokes and hilarious performances, keeping the coop filled with joy and amusement.",
  "A pensive philosopher, always lost in deep thoughts, offering wise perspectives and pondering the mysteries of life in the backyard.",
  "A fearless explorer, venturing into new territories with curiosity and bravery, inspiring others to embrace adventure in the backyard.",
  "A caring nurturer, always looking out for its flock members and spreading love, providing comfort and support in times of need.",
  "A funny chicken with a quick wit, tickling funny bones and brightening up the backyard with humorous remarks and playful antics.",
  "An enigmatic charmer, captivating others with its mysterious allure and leaving a lasting impression on everyone it meets in the coop.",
  "A mischievous troublemaker, adding excitement and laughter to the coop with playful pranks and amusing hijinks.",
  "A poetic soul, expressing emotions through beautiful verses that touch the heart, enchanting others with its lyrical clucks.",
  "A feathered jester, always ready with a funny quip or a hilarious gesture, infusing the flock with laughter and amusement in the backyard."
]


chicken_names = [
  "Super Santi", "Cutie Emma", "Marina", "Rama", "Bruno", "Joanna", "Charlotte", "Emily", "Pamela", "Esti", "Adam", "Pedro", "Eleganza Antonio", "Paul", "Katharine", "Ahmed", "Madhava", "William", "Ana", "Agustin", "Nic", "Maximillian", "Baran", "Begana", "Dabin", "Madam Esther", "James", "Sebi", "Zakariya"
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
                        name: chicken_names.sample,
                        address: ["Goerzallee 189, 14167 Berlin, Germany", "Billy-Wilder-Promenade 49, 14167 Berlin, Germany", "Glinkastraße 20, 10117 Berlin, Germany", "Seegefelder Str. 12, 13597 Berlin, Germany", "Ruppiner Chaussee 351, 13503 Berlin, Germany", "Bisonweg 155, 13503 Berlin, Germany", "Koenigsallee, 14193 Berlin, Germany", "Leipziger Straße, 10117 Berlin, Germany"].sample
                        )
  final_chicken = create_pics(images[i], chicken.name, chicken)
  final_chicken.save!
end

puts "👩🏻‍🦳👨🏿‍🦱 and 🐔 have been sucessfuly created "
