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
  name: "Microscopic Chairs",
  price: rand(1..500),
  description: "These chairs are so small that they can barely be seen with the naked eye, let alone be sat upon. Each chair requires a pair of tweezers to move or arrange, making them completely useless for any practical purpose.",
  user: users.sample,
  category: "Too Small",
  latitude: 48.8649574,
  longitude: 2.3800617, 
  address: "London"
)

# Item.create(
#   name: "Giraffe Umbrella",
#   price: rand(1..500),
#   description: "A 12-foot tall umbrella designed to shield giraffes from the rain. Humans will find it nearly impossible to use without assistance, but it makes for a great addition to any giraffe-enthusiast's collection.",
#   user: users.sample,
#   category: "Too Tall"
# )

# Item.create(
#   name: "Bubble Wrap Wallpaper",
#   price: rand(1..500),
#   description: "Cover your walls in continuous sheets of bubble wrap, offering hours of entertainment for those who love to pop bubbles. Unfortunately, the novelty wears off when you find out that hot glue sticks are your only mounting option.",
#   user: users.sample,
#   category: "Crunchy"
# )

# Item.create(
#   name: "Invisible Ink",
#   price: rand(1..500),
#   description: "This pen contains ink that is completely invisible, making it impossible to see whatever you write. Ideal for those who wish to keep a diary that no one, not even themselves, will ever be able to read.",
#   user: users.sample,
#   category: "Useless"
# )

# Item.create(
#   name: "Toilet Paper Cozy",
#   price: rand(1..500),
#   description: "A knitted cozy designed to keep your toilet paper warm and soft during cold winter nights. Unfortunately, the wool fibers shed, leaving unwanted fuzz on the tissue and complicating your bathroom activities.",
#   user: users.sample,
#   category: "Really Useless"
# )

# Item.create(
#   name: "One-Inch Tape Measure",
#   price: rand(1..500),
#   description: "A tape measure that measures up to only one inch. Marvel at your ability to measure things a quarter or a half inch long, but don't expect anything more.",
#   user: users.sample,
#   category: "Too Small"
# )

# Item.create(
#   name: "Anti-Gravity Pen",
#   price: rand(1..500),
#   description: "This pen uses anti-gravity technology to float away from any surface, making it impossible to pick up and write with. Writing a simple note will turn into a frustrating game of trying to catch your pen before it floats away.",
#   user: users.sample,
#   category: "Useless"
# )

# Item.create(
#   name: "Pink-fetti",
#   price: rand(1..500),
#   description: "A bag of tiny pink paper cutouts designed for decorating any space – turns out it's not actually suitable for any occasion as it is extremely difficult to clean up, causing a pink nuisance for months to come.",
#   user: users.sample,
#   category: "Pink"
# )

# Item.create(
#  name: "Giant Pencil",
#   price: rand(1..500),
#   description: "This novelty 5-foot tall pencil is too cumbersome to write with, and may also create holes in your walls as you attempt to navigate it through your home.",
#   user: users.sample,
#   category: "Too Tall"
# )

# Item.create(
#   name: "Glass Hammer",
#   price: rand(1..500),
#   description: "A stylish, yet impractical, hammer made of glass. It shatters upon impact, making it impossible to use for any actual hammering tasks.",
#   user: users.sample,
#   category: "Really Useless"
# )

# Item.create(
#   name: "Dehydrated Water",
#   price: rand(1..500),
#   description: "This can contains nothing but hope and air, just add water to create water. Perfect for those who are nostalgic about the old days of using powdered drinks.",
#   user: users.sample,
#   category: "Useless"
# )

# Item.create(
#   name: "Toothpaste Sandwich",
#   price: rand(1..500),
#   description: "Fresh minty toothpaste between two slices of bread.",
#   user: users.sample,
#   category: "Crunchy"
# )

# Item.create(
#   name: "Solar-Powered Flashlight",
#   price: rand(1..500),
#   description: "A flashlight that can only be charged in direct sunlight, making it functionally useless at the times when you actually need it: at night or in the dark.",
#   user: users.sample,
#   category: "Useless"
# )

# Item.create(
#   name: "Underwater Hair Dryer",
#   price: rand(1..500),
#   description: "An unfortunate attempt to combine a waterproof case with an electric hair dryer resulting in a device that blows bubbles rather than drying hair.",
#   user: users.sample,
#   category: "Really Useless"
# )

# Item.create(
#   name: "Pink Cactus",
#   price: rand(1..500),
#   description: "A cactus that has been spray-painted pink. It's impossible to tell when it needs watering, as the paint masks its natural color changes.",
#   user: users.sample,
#   category: "Pink"
# )

# Item.create(
#   name: "Inflatable Dartboard",
#   price: rand(1..500),
#   description: "An ironic and unconventional take on the classic dartboard, designed for those who enjoy impracticality and a good laugh. The darts will puncture the dartboard and rapidly deflate it.",
#   user: users.sample,
#   category: "Too Small"
# )

# Item.create(
#   name: "Wooden Microwave",
#   price: rand(1..500),
#   description: "This hand-crafted wooden microwave may be a beautiful work of art, but its lack of functionality and tendency to catch fire make it a real hazard in the kitchen.",
#   user: users.sample,
#   category: "Crunchy"
# )

# Item.create(
#   name: "Shoelace Tying Machine",
#   price: rand(1..500),
#   description: "A bulky and complicated contraption designed to tie your shoelaces for you. It takes far longer to set up the machine than it does to simply tie your own laces.",
#   user: users.sample,
#   category: "Really Useless"
# )

# Item.create(
#   name: "Treadmill Desk",
#   price: rand(1..500),
#   description: "Combine exercise and work with this treadmill desk, quickly realizing that the constant movement makes it impossible to focus on anything, causing accidents and ruined productivity.",
#   user: users.sample,
#   category: "Too Tall"
# )

# Item.create(
#   name: "Non-Stick Glue",
#   price: rand(1..500),
#   description: "A tube of glue that has been specifically formulated to have zero adhesive properties. Guaranteed not to stick to anything, including itself.",
#   user: users.sample,
#   category: "Useless"
# )

# Item.create(
#   name: "Silent Alarm Clock",
#   price: rand(1..500),
#   description: "An alarm clock with no audible alarm function, making it functionally no different from a regular wall clock. Guaranteed to never wake you up when you need it to.",
#   user: users.sample,
#   category: "Too Small"
# )

# Item.create(
#   name: "Battery-Powered Battery Charger",
#   price: rand(1..500),
#   description: "A battery charger that is itself powered by batteries. The device will use almost as much energy as it provides, making it ultimately pointless.",
#   user: users.sample,
#   category: "Useless"
# )

# Item.create(
#   name: "Fragile Glass Ladder",
#   price: rand(1..500),
#   description: "This artistic glass ladder is a beautiful decorative piece that absolutely should not be used as a functional ladder since it will shatter under any weight.",
#   user: users.sample,
#   category: "Too Tall"
# )

# Item.create(
#   name: "Pink Traffic Cones",
#   price: rand(1..500),
#   description: "Bright pink traffic cones, perfect for confusing drivers who rely on the predictability of the traditional orange, leading to possible chaos on the road.",
#   user: users.sample,
#   category: "Pink"
# )

# Item.create(
#   name: "Transparent Window Curtains",
#   price: rand(1..500),
#   description: "These clear curtains provide absolutely no sense of privacy while still requiring you to perform the tedious task of opening and closing them.",
#   user: users.sample,
#   category: "Really Useless"
# )

# Item.create(
#   name: "A Can of Crunchy Compressed Air",
#   price: rand(1..500),
#   description: "This can promises crunchy compressed air, but delivers a gust of regular air infused with millions of tiny particles, which will pepper your face upon release.",
#   user: users.sample,
#   category: "Crunchy"
# )

# Item.create(
#   name: "Self-Knotting Shoelaces",
#   price: rand(1..500),
#   description: "Shoelaces that automatically tie themselves into impossible-to-untangle knots, securing your shoes so permanently that they must be cut off to be removed.",
#   user: users.sample,
#   category: "Too Small"
# )

# Item.create(
#   name: "Left-Handed Screwdriver",
#   price: rand(1..500),
#   description: "Designed specifically for left-handed individuals who find using a regular screwdriver challenging; unfortunately, it still requires the same basic hand motions for screwing and unscrewing.",
#   user: users.sample,
#   category: "Useless"
# )

# Item.create(
#   name: "Ceiling Fan Hat",
#   price: rand(1..500),
#   description: "A stylish hat that doubles as a ceiling fan. It provides a cool breeze to those around it, but is so tall that it requires the wearer to stoop awkwardly.",
#   user: users.sample,
#   category: "Too Tall"
# )

# Item.create(
#   name: "Pink Tuxedo",
#   price: rand(1..500),
#   description: "A hot pink tuxedo that ensures you will stand out at any formal event, whether you like it or not. You may be asked to dress up as a flamingo and pose for photos.",
#   user: users.sample,
#   category: "Pink"
# )

# Item.create(
#   name: "Sandpaper Blanket",
#   price: rand(1..500),
#   description: "Designed to recreate the sensation of lying on a sandy beach, this sandpaper blanket is guaranteed to provide a harsh, abrasive texture, making for an excellent exfoliating experience if you can withstand the discomfort.",
#   user: users.sample,
#   category: "Crunchy"
# )

# Item.create(
#   name: "Cotton Candy Towel",
#   price: rand(1..500),
#   description: "A towel made of spun sugar that dissolves into a sticky mess upon contact with water. Use it to dry off only if you have unlimited access to showers.",
#   user: users.sample,
#   category: "Really Useless"
# )

# Item.create(
#   name: "Invisible Door Stopper",
#   price: rand(1..500),
#   description: "This transparent door stopper is designed to blend in with any interior design – it does so a little too well, as it becomes completely invisible and you'll end up tripping over it constantly.",
#   user: users.sample,
#   category: "Too Small"
# )

# Item.create(
#   name: "Escalator Shoes",
#   price: rand(1..500),
#   description: "Shoes with miniature escalator mechanisms built into their soles, adding noticeable weight and complexity without providing any discernible benefit, as you'll still be required to walk up stairs or slopes.",
#   user: users.sample,
#   category: "Too Tall"
# )

# Item.create(
#   name: "Foggy Glasses",
#   price: rand(1..500),
#   description: "Eyeglasses whose lenses are permanently fogged, preventing you from seeing clearly in any condition. The perfect accessory for those wanting to wander aimlessly.",
#   user: users.sample,
#   category: "Useless"
# )

# Item.create(
#   name: "Self-Filling Water Bottle",
#   price: rand(1..500),
#   description: "A water bottle that purports to be self-filling, but instead leaks water just as quickly as it fills up. It provides more of a watering-can experience than a hydration solution.",
#   user: users.sample,
#   category: "Really Useless"
# )

# Item.create(
#   name: "Pink Motorcycle Helmet",
#   price: rand(1..500),
#   description: "A neon pink motorcycle helmet that not only demands attention on the open road but also glows in the dark for added visibility. Excellent for riders who prefer style over subtlety.",
#   user: users.sample,
#   category: "Pink"
# )

# Item.create(
#   name: "Cactus Toothbrush",
#   price: rand(1..500),
#   description: "This toothbrush features bristles made of real cactus spines, offering an intensely painful brushing experience that is not recommended for anyone with teeth.",
#   user: users.sample,
#   category: "Crunchy"
# )

# Item.create(
#   name: "Keyless Door Lock",
#   price: rand(1..500),
#   description: "A door lock that doesn't require a key to operate. Once installed and locked, it cannot be opened again, effectively turning any door into a wall.",
#   user: users.sample,
#   category: "Too Small"
# )

# Item.create(
#   name: "Chocolate Umbrella",
#   price: rand(1..500),
#   description: "Looks delicious, smells delicious, but dissolves into a sticky mess at the first sign of rain. Keep it away from high temperatures and open mouths.",
#   user: users.sample,
#   category: "Too Tall"
# )

# Item.create(
#   name: "Dehydrated Swimming Pool",
#   price: rand(1..500),
#   description: "A flat, empty bag resembling a swimming pool, but without any water – just add 20,000 gallons of water to create a fully functional backyard pool.",
#   user: users.sample,
#   category: "Useless"
# )

# Item.create(
#   name: "Edible Button Battery",
#   price: rand(1..500),
#   description: "This battery is made of specially formulated edible materials, however, it provides absolutely no energy and is potentially hazardous if ingested.",
#   user: users.sample,
#   category: "Really Useless"
# )

# Item.create(
#   name: "Pink Refrigerator",
#   price: rand(1..500),
#   description: "Transform your kitchen into a Barbie dream house with this oversized, pastel pink refrigerator. While it keeps your food cold, your neighbors will constantly doubt your design choices.",
#   user: users.sample,
#   category: "Pink"
# )

# Item.create(
#   name: "Inflatable Bowling Ball",
#   price: rand(1..500),
#   description: "This air-filled plastic ball might look like a bowling ball, but it's definitely not built for knocking down pins or withstanding the weight of a heavy hand.",
#   user: users.sample,
#   category: "Crunchy"
# )

# Item.create(
#   name: "Spider Web Brush",
#   price: rand(1..500),
#   description: "A brush designed for cleaning spider webs that is made from actual spider silk, rendering it incredibly sticky and immediately collecting more webs than it removes.",
#   user: users.sample,
#   category: "Too Small"
# )

# Item.create(
#   name: "Detachable Ladder",
#   price: rand(1..500),
#   description: "A ladder that effortlessly comes apart in multiple pieces while in use. Offers an added challenge for those trying to reach high places.",
#   user: users.sample,
#   category: "Too Tall"
# )

# Item.create(
#   name: "Reverse Umbrella",
#   price: rand(1..500),
#   description: "An umbrella designed to be held upside down, ensuring that you are caught in the rain and fully soaked, while your umbrella collects water like a bucket.",
#   user: users.sample,
#   category: "Useless"
# )

# Item.create(
#   name: "Indoor Firework Set",
#   price: rand(1..500),
#   description: "A collection of fireworks carefully curated for use indoors. The warning label specifies that proper use is not guaranteed, and the manufacturer accepts no responsibility for any consequential fires or injuries.",
#   user: users.sample,
#   category: "Really Useless"
# )

# Item.create(
#   name: "Pink Snow Shovel",
#   price: rand(1..500),
#   description: "Stand out while shoveling your driveway with this eye-catching pink snow shovel. It offers no additional benefits apart from alarming the neighbors.",
#   user: users.sample,
#   category: "Pink"
# )

# Item.create(
#   name: "Jellybean Storage System",
#   price: rand(1..500),
#   description: "A wall-mounted storage system for organizing individual jellybeans. Features an excessive number of compartments and is extremely difficult to clean after it becomes dirty.",
#   user: users.sample,
#   category: "Crunchy"
# )

# Item.create(
#   name: "Left-Handed Steering Wheel",
#   price: rand(1..500),
#   description: "A steering wheel designed to be used by left-handed drivers, providing no difference in functionality or driving experience, merely highlighting the uniqueness of the user.",
#   user: users.sample,
#   category: "Too Small"
# )

# Item.create(
#   name: "Unicycle Stilts",
#   price: rand(1..500),
#   description: "Stilts that cleverly integrate a unicycle into their design, making you simultaneously taller and more unsteady. For expert unicyclists only; the novice user is likely to fall over repeatedly.",
#   user: users.sample,
#   category: "Too Tall"
# )

# Item.create(
#   name: "Sponge Pants",
#   price: rand(1..500),
#   description: "Pants made of highly absorbent sponge material, designed to absorb spills and clean floors as you walk. Unfortunately, they also weigh significantly more when wet, greatly hindering movement.",
#   user: users.sample,
#   category: "Useless"
# )

# Item.create(
#   name: "Pink Noise Generator",
#   price: rand(1..500),
#   description: "A speaker that emits a soothing pink noise specifically tuned to the frequency of pink objects. Pairs beautifully with any pink living space.",
#   user: users.sample,
#   category: "Pink"
# )

# Item.create(
#   name: "Broken Cookie Jar",
#   price: rand(1..500),
#   description: "A beautiful handmade cookie jar that has been meticulously shattered into pieces and glued back together. It's no longer functional, but serves as a reminder that everything in life is temporary.",
#   user: users.sample,
#   category: "Crunchy"
# )

# Item.create(
#   name: "Invisible Clothing Hangers",
#   price: rand(1..500),
#   description: "A set of transparent hangers that blend seamlessly into any closet, making it nearly impossible to find an available hanger when you need one.",
#   user: users.sample,
#   category: "Too Small"
# )

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
