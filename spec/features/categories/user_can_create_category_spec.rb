require "rails_helper"

describe "As a user" do
  describe "I can create a new Category" do
    before :each do
      @category = Category.create(title: "Technology")

      visit new_category_path
    end

    it "will display a form and a submit button and will redirect me to its show page" do

      fill_in "category[title]", with: "Entertainment"

      click_button("Create Category")

      expect(current_path).to eq("/categories/#{Category.last.id}")
    end

    it "will also reject a category create submission that duplicates a category" do

      fill_in "category[title]", with: "Technology"

      click_button("Create Category")

      expect(page).to have_content("Create a New Category")
    end
  end
end
