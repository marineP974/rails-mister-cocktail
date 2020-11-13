require 'json'
require 'open-uri'
require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")

puts "ok pour les 3"
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredient = JSON.parse(ingredients_serialized)


ingredient['drinks'].each do |row|
  Ingredient.create(name: row['strIngredient1'])
end

20.times do
  Cocktail.create(name: Faker::Food.fruits)
end
puts "finiii"
