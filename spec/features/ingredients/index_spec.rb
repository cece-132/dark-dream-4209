require 'rails_helper'

RSpec.describe "index page" do
    describe 'User story 3' do
        it 'shows a list of ingredients and the number of recipes it is used in' do
            spaghetti = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
            pie = Recipe.create!(name: "Pie", complexity: 5, genre: "American")

            pasta = Ingredient.create!(name: "Pasta", cost: 2)
            meat = Ingredient.create!(name: "Meat", cost: 5)
            cheese = Ingredient.create!(name: "Cheese", cost: 3)

            apple =Ingredient.create!(name: 'Apple', cost: 1)
            crust =Ingredient.create!(name: 'Crust', cost: 3)

            spaghetti_ingredients = RecipeIngredient.create!(recipe_id: spaghetti.id , ingredient_id: pasta.id)
            spaghetti_ingredients = RecipeIngredient.create!(recipe_id: spaghetti.id , ingredient_id: meat.id)
            spaghetti_ingredients = RecipeIngredient.create!(recipe_id: spaghetti.id , ingredient_id: cheese.id)
            pie_ingredients = RecipeIngredient.create!(recipe_id: pie.id , ingredient_id: apple.id)
            pie_ingredients = RecipeIngredient.create!(recipe_id: pie.id , ingredient_id: crust.id)
            pie_ingredients = RecipeIngredient.create!(recipe_id: spaghetti.id , ingredient_id: crust.id)
            
            visit "/ingredients" 

            expect(page).to have_content("Pasta: 1")
            expect(page).to have_content("Crust: 2")

        end
    end
end