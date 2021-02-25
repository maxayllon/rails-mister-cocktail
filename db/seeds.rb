require 'json'
require 'open-uri'

puts 'Destroying (I) previous seeds'
Ingredient.destroy_all

puts "Creation of new seeds"

filepath = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
serialized_ingredients = open(filepath).read
ingredients = JSON.parse(serialized_ingredients)

ingredients.each do |ingredient|
  ingredient[1].each do |i|
    Ingredient.create(name: i["strIngredient1"])
  end
end

puts "Seeds created"
