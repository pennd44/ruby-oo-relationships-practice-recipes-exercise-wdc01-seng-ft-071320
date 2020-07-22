require_relative '../config/environment.rb'
require 'date'
bob=User.new("Bob")
steve=User.new("Steve")

tuna_pasta = Recipe.new("Tuna Pasta")
pizza = Recipe.new("Pizza")

flour = Ingredient.new("Flour")
tuna = Ingredient.new("Tuna")
pepperoni = Ingredient.new("Pepperoni")

bob_tuna_pasta = RecipeCard.new(bob, tuna_pasta, "22/7/20", 4)
bob_pizza = RecipeCard.new(bob, pizza, "16/4/20", 5)
steve_pizza= RecipeCard.new(steve, pizza, "10/3/20", 3)
steve_tuna_pasta= RecipeCard.new(steve, tuna_pasta, "13/2/05", 4)


tuna_pasta_flour = RecipeIngredient.new(tuna_pasta, flour)
tuna_pasta_tuna = RecipeIngredient.new(tuna_pasta, tuna)
pizza_flour = RecipeIngredient.new(pizza, flour)

steve_tuna = Allergy.new(steve, tuna)
steve_flour = Allergy.new(steve, flour)

#puts pizza.users
#puts tuna_pasta.ingredients

#tuna_pasta.allergens
#pizza.add_ingredients(pepperoni)
#puts Recipe.most_popular

#steve.allergens
#steve.top_three_recipes
#bob.most_recent_recipe

# flour.allergen_ingredients

#Ingredient.most_common_allergen
bob.safe_recipes

binding.pry
