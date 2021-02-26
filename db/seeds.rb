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


puts 'Destroying (C) previous seeds'
Cocktail.destroy_all


puts "other Seeds"
file = URI.open('https://cdn-elle.ladmedia.fr/var/plain_site/storage/images/elle-a-table/recettes-de-cuisine/mojito-549832/6706092-9-fre-FR/Mojito.jpg')
cocktail = Cocktail.create(name:'Mojito')
cocktail.photo.attach(io: file, filename: 'mojito.jpg', content_type: 'image/jpg')

file = URI.open('https://www.lesepicesrient.fr/wp-content/uploads/2017/08/punch-planteur-fruits-ete.jpg')
cocktail = Cocktail.create(name:'Punch')
cocktail.photo.attach(io: file, filename: 'punch.jpg', content_type: 'image/jpg')

file = URI.open('https://www.196flavors.com/wp-content/uploads/2018/09/cuba-libre-1-FP.jpg')
cocktail = Cocktail.create(name:'Cuba Libre')
cocktail.photo.attach(io: file, filename: 'cuba.jpg', content_type: 'image/jpg')


puts "New Seeds created"
