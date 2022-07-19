require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

  describe "Model methods" do
    it "#student)count" do
      pie = Recipe.create!(name: "Pie", complexity: 5, genre: "American")
      spaghetti = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")

      apple =Ingredient.create!(name: 'Apple', cost: 1)
      crust =Ingredient.create!(name: 'Crust', cost: 3)

      pie_ingredients = RecipeIngredient.create!(recipe_id: spaghetti.id , ingredient_id: crust.id)
      pie_ingredients = RecipeIngredient.create!(recipe_id: pie.id , ingredient_id: apple.id)
      pie_ingredients = RecipeIngredient.create!(recipe_id: pie.id , ingredient_id: crust.id)

      expect(crust.ingredient_count).to eq(2)
    end
  end
end
