puts "Cleaning database"
User.destroy_all
Category.destroy_all
puts "*****************"

puts "Creating users"
User.create(email: 'test@test.com', password: 'password', name: "Ben Fanning", address: "33 Peacock Place, Islington, N1 1YG", sex: "male", age: 25, admin: true, approved: true)
User.create(email: 'tomjones@gmail.com', password: 'password', name: "Tom Jones", address: "33 Peacock Place, Islington, N1 1YG", sex: "male", age: 50, admin: false, approved: false)
User.create(email: 'berniesanders@dnc.com', password: 'password', name: "Bernie Sanders", address: "33 Peacock Place, Islington, N1 1YG", sex: "male", age: 79, admin: false, approved: false)
User.create(email: 'alfredhitchcock@imdb.com', password: 'password', name: "Alfred Hitchcock", address: "33 Peacock Place, Islington, N1 1YG", sex: "male", age: 90, admin: false, approved: true)

puts "Creating categories"
Category.create!(name: 'Vehiculos')
Category.create!(name: 'Arte')
Category.create!(name: 'Motocicletas')
Category.create!(name: 'Bicicletas')
