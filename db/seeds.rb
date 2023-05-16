# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "cleaning database"

Booking.destroy_all
Item.destroy_all
User.destroy_all


puts "creating database"
User.create(
  email: "user1@example.com",
  password: "password",
  first_name: "John",
  last_name: "Doe"
)

User.create(
  email: "user2@example.com",
  password: "password",
  first_name: "Jane",
  last_name: "Smith"
)

# Create items
Item.create(
  name: "Item 1",
  price: 10,
  description: "This is item 1's description",
  user_id: 19,
)

Item.create(
  name: "Item 2",
  price: 15,
  description: "This is item 2's description",
  user_id: 20,
)

# Create bookings
Booking.create(
  user_id: ,
  item_id: 2
)

Booking.create(
  user_id: 19,
  item_id: 1
)

puts "users #{User.count}"
puts "created #{Item.count} items"
puts "bookings #{Booking.count}"
