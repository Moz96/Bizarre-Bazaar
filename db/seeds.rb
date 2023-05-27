# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# OpenAI for seeding items https://github.com/alexrudall/ruby-openai
require "openai"
require "open-uri"
openai = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_ACCESS_TOKEN"))


puts "Cleaning database"

Booking.destroy_all
Item.destroy_all
User.destroy_all

print "Filling database"

categories = ["Useless", "Really Useless", "Too Tall", "Too Small", "Crunchy", "Pink"]
users = []

10.times do |i|
  users << User.create(
              email: "user#{i + 1}@example.com",
              password: "password",
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name
            )
end

# Create items
Item.create(
  name: "Titan's Toothpick",
  price: rand(1..500),
  description: "This inordinately oversized toothpick is excellent for picking the teeth of colossal giants. Standing at a towering three stories tall, it is quite improbable that mere mortals will find a use for it.",
  user: users.sample,
  category: "Too Tall",
  address: "1101 Market St, Philadelphia, PA 19107, USA"
)

Item.create(
  name: "Nano Sofa",
  price: rand(1..500),
  description: "Our premier sofa is specifically crafted for the lifestyle of subatomic particles. With its seamless design, setting it up anywhere in the nucleus will be a breeze, although utterly impractical for humans.",
  user: users.sample,
  category: "Too Small",
  address: "220 Montgomery St, San Francisco, CA 94104, USA"
)

Item.create(
  name: "Fuchsia Sphinx",
  price: rand(1..500),
  description: "The Fuchsia Sphinx is an aesthetically unconventional replica of the Great Sphinx. Its eye-catching shade of pink adds a vibrant splash of color to any historical monument collection, but is unfit for serious collectors.",
  user: users.sample,
  category: "Pink",
  address: "1 Infinite Loop, Cupertino, CA 95014, USA"
)

Item.create(
  name: "Crispy Tennis Balls",
  price: rand(1..500),
  description: "Our tennis balls, encased in a crunchy, brittle shell, add an element of surprise to any game. While potentially hazardous to your racket's well-being, they may satisfy your craving for crunch.",
  user: users.sample,
  category: "Crunchy",
  address: "1125 Deerfield Pkwy, Buffalo Grove, IL 60089, USA"
)

Item.create(
  name: "The Metronomic Fish",
  price: rand(1..500),
  description: "The Metronomic Fish is our weekly special. This battery-operated pet fish offers a continuous, rhythmic ticking sound that serves no real purpose other than to annoy your friends and family.",
  user: users.sample,
  category: "Items of the Week",
  address: "11 Penn Plaza, New York, NY 10001, USA"
)

Item.create(
  name: "Cheddar Shoes",
  price: rand(1..500),
  description: "Made entirely of genuine, aged cheddar cheese, these shoes are a bold statement piece. However, their susceptibility to melting or attracting rodents, make them undesirable for practical use.",
  user: users.sample,
  category: "Cheesy",
  address: "7000 Kennedy Blvd E, Guttenberg, NJ 07093, USA"
)

Item.create(
  name: "Dangerous Desk",
  price: rand(1..500),
  description: "Our Dangerous Desk boasts an inventive design, featuring protruding spikes and precariously angled edges. Although hazardous for humans to use, it perfectly captures the essence of an edgy aesthetic.",
  user: users.sample,
  category: "Edgy",
  address: "Boston Tea Party Ships & Museum, 306 Congress St, Boston, MA 02210, USA"
)

Item.create(
  name: "Mountaintop Ant Farm",
  price: rand(1..500),
  description: "This breathtaking replica of Mount Everest should serve as an inspirational backdrop for an ant colony. The unreachably high peak will remind ants and humans alike of life's insurmountable challenges.",
  user: users.sample,
  category: "Poignant",
  address: "1000 Elysian Park Ave, Los Angeles, CA 90012, USA"
)

Item.create(
  name: "Portable Wall",
  price: rand(1..500),
  description: "Introducing our state-of-the-art Portable Wall, designed to provide a barrier wherever needed. While it has the ability to divide spaces, its immense size and weight make it difficult to move, rendering it practically useless.",
  user: users.sample,
  category: "Could be useful",
  address: "111 Sutter St, San Francisco, CA 94104, USA"
)

Item.create(
  name: "Giraffe's Pen",
  price: rand(1..500),
  description: "Our Giraffe's Pen is crafted exclusively for the long-necked sophisticates of the animal kingdom. Intended for lofty authors, it is unlikely that any human will be able to use it to jot down their thoughts.",
  user: users.sample,
  category: "Too Tall",
  address: "1265 Snelling Ave N, St Paul, MN 55108, USA"
)

Item.create(
  name: "Miniature Sailboat",
  price: rand(1..500),
  description: "Designed with exacting precision and attention to detail, this miniature sailboat is just the right size for a flea to set sail. Though visually stunning, it remains entirely unusable by human sailors.",
  user: users.sample,
  category: "Too Small",
  address: "500 Sloat Ave, San Francisco, CA 94132, USA"
)

Item.create(
  name: "Flamingo Shoelaces",
  price: rand(1..500),
  description: "These vibrant pink flamingo-patterned shoelaces are guaranteed to be the center of attention wherever you go. Perfect for those aiming to showcase their boldness, albeit not suited for individuals seeking subtlety.",
  user: users.sample,
  category: "Pink",
  address: "880 S Lemon Way, Denver, CO 80224, USA"
)

Item.create(
  name: "Crunchy Umbrella",
  price: rand(1..500),
  description: "Constructed using crunchy materials, our Crunchy Umbrella creates a satisfying racket with every use. However, its questionable water resistance may fail to protect you from inclement weather.",
  user: users.sample,
  category: "Crunchy",
  address: "100 Cambridge Street, Charlestown, MA 02129, USA"
)

Item.create(
  name: "One-Legged Chair",
  price: rand(1..500),
  description: "Balance and discipline are the core tenets of this week's item. Our One-Legged Chair takes seating to the extreme, making it nearly impossible to relax and use as intended without toppling over.",
  user: users.sample,
  category: "Items of the Week",
  address: "2131 Marble Valley Rd, Gladys, VA 24554, USA"
)

Item.create(
  name: "Camembert Grande Necklace",
  price: rand(1..500),
  description: "The Camembert Grande Necklace merges high fashion and dairy delights. Made from authentic Camembert cheese, it is a definite conversation starter but might create an undesirable, pungent aura.",
  user: users.sample,
  category: "Cheesy",
  address: "31 St. James Avenue, Suite 395, Boston, MA 02116, USA"
)

Item.create(
  name: "Sharp Pillow",
  price: rand(1..500),
  description: "The multi-angular, metallic Sharp Pillow is perfect for the artful home decorator seeking a daring aesthetic. Regrettably, it is likely to cause discomfort to anyone seeking to rest their head on it.",
  user: users.sample,
  category: "Edgy",
  address: "1093 N Ocean Blvd, Palm Beach, FL 33480, USA"
)

items = Item.all
items.each_with_index do |item, index|
  response = openai.images.generate(parameters: { prompt: "#{item.name}, #{item.category}", size: "256x256" })
  url = URI.open(response.dig("data", 0, "url"))
  item.photo.attach(io: url, filename: "item#{index}_image.png", content_type: "image/png")
end

puts "\n"
puts "\n"
puts "\e[32m--Done!--\e[0m"
puts "Users count: #{User.count}"
puts "Items count: #{Item.count}"
puts "Bookings count: #{Booking.count}"
puts "\n"
