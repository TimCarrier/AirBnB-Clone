# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Added gem "faker" to Gemfile
Dog.destroy_all

20.times do
  dogs = Dog.new(
    name: Faker::Creature::Dog.name,
    age: rand(1..15),
    disponibility: Faker::Date.between(from: '2024-05-28', to: '2024-06-03'),
    race: Faker::Creature::Dog.breed,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    address: Faker::Address.full_address,
    rating: rand(1..5),
    price: rand(10..100)
  )
  dogs.save!
end
puts 'Finished!'

#            __
#       (___()'`;
#       /,    /`
#       \\"--\\
#
#  Woof! Woof! 🐶
