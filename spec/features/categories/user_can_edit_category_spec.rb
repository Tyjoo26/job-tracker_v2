require "rails_helper"

describe "As a user" do
  describe "I can edit a specific category" do
    it "will display a form with fields and a submit button" do
      @entertainment = Category.create(title: "Entertainment")

      visit edit_category_path(@entertainment)

      fill_in"category[title]", with: "Kdrama"

      click_button("Edit")
      expect(current_path).to eq(category_path(@entertainment))
      expect(page).to have_content("Kdrama")
    end
  end
end
