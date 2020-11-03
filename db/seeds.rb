# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Sitter.create(
  name: "Johnny",
  birthday: "1989-08-03",
  years_of_experience: 3,
  bio: "I'm another person",
  contact_name: "H. G. Rickesmacker",
  contact_phone: "9176587897"
)

Sitter.create(
  name: "Bart",
  birthday: "1995-08-03",
  years_of_experience: 1,
  bio: "I'm a yellow person",
  contact_name: "Marge Simpson",
  contact_phone: "9178387897"
)