require 'rails_helper'

describe 'As a user' do
  describe "I see a category show page" do
    it "displays category title with an option to edit the category" do
      @entertainment = Category.create(title: "Entertainment")

      visit category_path(@entertainment)

      expect(page).to have_content("Entertainment")

      click_link("Edit")

      expect(current_path).to eq(edit_category_path(@entertainment))
    end

    it "also has an option to delete the category and redirects to category index" do
      @entertainment = Category.create(title: "Entertainment")

      visit category_path(@entertainment)

      expect(page).to have_content("Entertainment")

      click_link("Delete")

      expect(current_path).to eq(categories_path)
    end
  end
end
