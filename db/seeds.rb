require 'open-uri'
require 'json'

Ingredient.destroy_all
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
cocktails = JSON.parse(open(url).read)

cocktails['drinks'].each do |ingredient|
  Ingredient.create!(name: ingredient['strIngredient1'])
end
