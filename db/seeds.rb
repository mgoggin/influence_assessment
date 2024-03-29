# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
password = "11c178e90ddae2c875314f976f96"

Player
  .create_with(
    password:,
    password_confirmation: password,
    age: rand(18..120),
    gender: Gender.all.sample
  )
  .find_or_create_by!(email: 'test@example.com')

100.times do
  Offer.create!(
    name: Faker::Lorem.words(number: rand(2..4)),
    description: Faker::Marketing.buzzwords,
    gender: Gender.all.sample,
    age_group: AgeGroup.all.sample
  )
end
