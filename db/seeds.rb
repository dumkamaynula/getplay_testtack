# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@employees = Employee.delete_all
Employee.create(name: "Andy Tor", type_of_work: "writer")
Employee.create(name: "Shaim Dear", type_of_work: "writer")
Employee.create(name: "Loo Nee", type_of_work: "writer")
Employee.create(name: "Arny Vald", type_of_work: "designer")
Employee.create(name: "Man Hatten", type_of_work: "designer")
Employee.create(name: "Jackie Chan", type_of_work: "designer")
Employee.create(name: "Bruice Lee", type_of_work: "illustrator")
Employee.create(name: "Vang Lee", type_of_work: "illustrator")
Employee.create(name: "Toby Tobias", type_of_work: "illustrator")
Employee.create(name: "Joe Bang", type_of_work: "composer")
Employee.create(name: "Joe Fisherman", type_of_work: "composer")
Employee.create(name: "Paul Rubben", type_of_work: "composer")
Employee.create(name: "Patrick Dot", type_of_work: "developer")
Employee.create(name: "Joe Silver", type_of_work: "developer")
Employee.create(name: "Al Nadan", type_of_work: "developer")