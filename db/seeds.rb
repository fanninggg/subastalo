require "open-uri"

puts "Cleaning database"
User.destroy_all
Category.destroy_all
Product.destroy_all
puts "*****************"

puts "Creating users"
User.create(email: 'test@test.com', password: 'password', name: "Ben Fanning", address: "33 Peacock Place, Islington, N1 1YG", sex: "male", age: 25, admin: true, approved: true)
User.create(email: 'tomjones@gmail.com', password: 'password', name: "Tom Jones", address: "33 Peacock Place, Islington, N1 1YG", sex: "male", age: 50, admin: false, approved: false)
User.create(email: 'berniesanders@dnc.com', password: 'password', name: "Bernie Sanders", address: "33 Peacock Place, Islington, N1 1YG", sex: "male", age: 79, admin: false, approved: false)
User.create(email: 'alfredhitchcock@imdb.com', password: 'password', name: "Alfred Hitchcock", address: "33 Peacock Place, Islington, N1 1YG", sex: "male", age: 90, admin: false, approved: true)

puts "Creating categories"
vehicles = Category.new(name: 'Vehiculos')
vehicles.save
Category.create!(name: 'Arte')
Category.create!(name: 'Motocicletas')
Category.create!(name: 'Bicicletas')

puts "Creating Products"
file = URI.open('https://www.carscoops.com/wp-content/uploads/2020/02/2020-toyota-laund-cruiser-horizon-sahara-edition-australia-1.jpg')
product = Product.new(name: "LandCruiser Sahara Edition 6.0L", description: "A rugged piece of kit which can take on everything you can throw at it. Repossessed from a cartel boss.", opening_price: 2000000, maximum_price: 20000000, start_time: DateTime.new(2021,9,2,17), end_time: DateTime.new(2021,9,1,17), category: vehicles)
product.photos.attach(io: file, filename: 'landcruiser.png', content_type: 'image/png')
product.save

file = URI.open('https://i.ebayimg.com/00/s/MTIwMFgxNjAw/z/8QgAAOSwAkZelmos/$_57.JPG?set_id=8800005007')
product = Product.new(name: "Ford Escape", description: "The best car Ben Fanning ever owned. Literally a machine", opening_price: 2000000, maximum_price: 20000000, start_time: DateTime.new(2021,9,2,17), end_time: DateTime.new(2021,9,1,17), category: vehicles)
product.photos.attach(io: file, filename: 'escape.png', content_type: 'image/png')
product.save

file = URI.open('http://momentcar.com/images/dodge-grand-caravan-2002-7.jpg')
product = Product.new(name: "Dodge Grand Caravan", description: "Easy to turn into a home made campervan, can scale the Rockies with no issues!", opening_price: 1400000, maximum_price: 20000000, start_time: DateTime.new(2021,9,2,17), end_time: DateTime.new(2021,9,1,17), category: vehicles)
product.photos.attach(io: file, filename: 'caravan.png', content_type: 'image/png')
product.save

file = URI.open('https://pictures.topspeed.com/IMG/jpg/200904/2009-renault-clio-campus-2.jpg')
product = Product.new(name: "Clio Campus", description: "Ideal first car for a 17 year old trying unsuccesfully to go out on the pull", opening_price: 500000, maximum_price: 20000000, start_time: DateTime.new(2021,9,2,17), end_time: DateTime.new(2021,9,1,17), category: vehicles)
product.photos.attach(io: file, filename: 'clio.png', content_type: 'image/png')
product.save

file = URI.open('https://car-images.bauersecure.com/pagefiles/92953/1752x1168/audi_a3_sportback_23.jpg?mode=max&quality=90&scale=down')
product = Product.new(name: "Audi A3", description: "A standard German vehicles. Will never break down, ever, under any circumstances. ", opening_price: 5000000, maximum_price: 20000000, start_time: DateTime.new(2021,9,2,17), end_time: DateTime.new(2021,9,1,17), category: vehicles)
product.photos.attach(io: file, filename: 'audi.png', content_type: 'image/png')
product.save

file = URI.open('https://cdn2.carbuyer.co.uk/sites/carbuyer_d7/files/toyota-prius-hybrid-hatchback-cutout.jpg')
product = Product.new(name: "Toyota Prius", description: "Thinking of becoming an uber driver? Look no further", opening_price: 2000000, maximum_price: 2350000, start_time: DateTime.new(2021,5,2,17), end_time: DateTime.new(2021,5,6,17), category: vehicles)
product.photos.attach(io: file, filename: 'toyota.png', content_type: 'image/png')
product.save

