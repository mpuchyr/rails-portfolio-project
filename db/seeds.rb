# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(username: "h.newton", email: "h@example.com", password: "password")
User.create(username: "ansel.a", email: "ansel@photos.com", password: "12345")
User.create(username: "a.liebovitz", email: "al@example.com", password: "password")

Location.create(name: "London")
Location.create(name: "Tokyo")
Location.create(name: "Chicago")
Location.create(name: "New York")




