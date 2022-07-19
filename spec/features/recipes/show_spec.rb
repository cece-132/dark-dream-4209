require 'rails_helper'

RSpec.describe "show page" do
    describe 'User story w2' do
        it 'shows a list of ingredients' do
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
            
            visit "/recipes/#{spaghetti.id}" 

            expect(page).to have_content("Pasta")
            expect(page).to have_content("Meat")
            expect(page).to have_content("Cheese")
        end
    end

    describe 'user story 4' do
        it 'finds the sum cost for each recipe' do
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
            
            visit "/recipes/#{spaghetti.id}" 

            expect(page).to have_content("Total Cost: 10")
        end
    end
end