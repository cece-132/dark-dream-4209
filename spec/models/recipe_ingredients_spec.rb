require 'rails_helper'

RSpec.describe RecipeIngredient, type: :model do

  describe 'relationships' do
    it {should belong_to :recipe}
    it {should belong_to :ingredient}
  end

  describe 'model methods' do
    it 'can find the total cost' do
      spaghetti = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")

      pasta = Ingredient.create!(name: "Pasta", cost: 2)
      meat = Ingredient.create!(name: "Meat", cost: 5)
      cheese = Ingredient.create!(name: "Cheese", cost: 3)

      spaghetti_ingredients = RecipeIngredient.create!(recipe_id: spaghetti.id , ingredient_id: pasta.id)
      spaghetti_ingredients = RecipeIngredient.create!(recipe_id: spaghetti.id , ingredient_id: meat.id)
      spaghetti_ingredients = RecipeIngredient.create!(recipe_id: spaghetti.id , ingredient_id: cheese.id)

      expect(RecipeIngredient.total_cost).to eq(10)
    end
  end

end
