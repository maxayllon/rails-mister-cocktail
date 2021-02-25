puts 'Destroying previous seeds'
Ingredient.destroy_all

puts "Creation of new seeds"

Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")

puts "Seeds created"
