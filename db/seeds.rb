# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "openai"

puts "Cleaning database"

Booking.destroy_all
Item.destroy_all
User.destroy_all

print "Filling database"

categories = ["Useless", "Really Useless", "Too Tall", "Too Small", "Crunchy", "Pink"]

# Create users
21.times do |i|
  print "."
  user = User.create(
    email: "user#{i + 1}@example.com",
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )

  # Create items
  Item.create(
    name: "Item #{i + 1}",
    price: rand(1..500),
    description: "This is item #{i + 1}'s description",
    user: user,
    category: categories.sample
  )
end

puts "\n"
puts "\n"
puts "\e[32m--Done!--\e[0m"
puts "Users count: #{User.count}"
puts "Items count: #{Item.count}"
puts "Bookings count: #{Booking.count}"
puts "\n"
