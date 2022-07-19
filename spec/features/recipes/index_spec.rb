require 'rails_helper'

RSpec.describe 'Recipes' do
    describe 'User story 1' do
        it ' shows the index with a list of all the recipes' do
          spaghetti = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
            
          visit '/recipes'
          within "#recipes-#{spaghetti.id}" do
            expect(page).to have_content("Name: Spaghetti")
            expect(page).to have_content("Complexity: 2")
            expect(page).to have_content("Genre: Italian")
          end
        end
    end
end