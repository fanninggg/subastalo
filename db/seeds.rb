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
Product.create(name: "LandCruiser Sahara Edition 6.0L", description: "A rugged piece of kit which can take on everything you can throw at it. Repossessed from a cartel boss.", opening_price: 20000, maximum_price: 200000, start_time: DateTime.new(2021,9,2,17), end_time: DateTime.new(2021,9,1,17), category: vehicles)
Product.create(name: "Ford Escape", description: "The best car Ben Fanning ever owned. Literally a machine", opening_price: 20000, maximum_price: 200000, start_time: DateTime.new(2021,9,2,17), end_time: DateTime.new(2021,9,1,17), category: vehicles)
Product.create(name: "Dodge Grand Caravan", description: "Easy to turn into a home made campervan, can scale the Rockies with no issues!", opening_price: 14000, maximum_price: 200000, start_time: DateTime.new(2021,9,2,17), end_time: DateTime.new(2021,9,1,17), category: vehicles)
Product.create(name: "Clio Campus", description: "Ideal first car for a 17 year old trying unsuccesfully to go out on the pull", opening_price: 5000, maximum_price: 200000, start_time: DateTime.new(2021,9,2,17), end_time: DateTime.new(2021,9,1,17), category: vehicles)
Product.create(name: "Audio A3", description: "A standard German vehicles. Will never break down, ever, under any circumstances. ", opening_price: 50000, maximum_price: 200000, start_time: DateTime.new(2021,9,2,17), end_time: DateTime.new(2021,9,1,17), category: vehicles)
Product.create(name: "Toyota Prius", description: "Thinking of becoming an uber driver? Look no further", opening_price: 20000, maximum_price: 23500, start_time: DateTime.new(2021,5,2,17), end_time: DateTime.new(2021,5,6,17), category: vehicles)
