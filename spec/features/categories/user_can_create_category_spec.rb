require "rails_helper"

describe "As a user" do
  describe "I can create a new Category" do
    before :each do
      visit new_category_path
    end

    it "will display a form and a submit button and will redirect me to its show page" do

      fill_in "category[title]", with: "Entertainment"

      click_button("Create Category")

      expect(current_path).to eq("/categories/#{Category.last.id}")
    end
  end
end
