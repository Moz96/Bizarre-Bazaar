# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database"

Booking.destroy_all
Item.destroy_all
User.destroy_all

puts "Creating database"

# Create users
user1 = User.create(
  email: "user1@example.com",
  password: "password",
  first_name: "John",
  last_name: "Doe"
)

user2 = User.create(
  email: "user2@example.com",
  password: "password",
  first_name: "Jane",
  last_name: "Smith"
)

# Create items
item1 = Item.create(
  name: "Item 1",
  price: 10,
  description: "This is item 1's description",
  user: user1
)

item2 = Item.create(
  name: "Item 2",
  price: 15,
  description: "This is item 2's description",
  user: user2
)

# Create bookings
Booking.create(
  user: user1,
  item: item2
)

Booking.create(
  user: user2,
  item: item1
)

puts "Users count: #{User.count}"
puts "Items count: #{Item.count}"
puts "Bookings count: #{Booking.count}"
