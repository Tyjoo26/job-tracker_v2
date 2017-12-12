require "rails_helper"

describe "As a user" do
  describe "when i visit /categories " do
    before :each do
      @entertainment = Category.create(title: "Entertainment")


      visit categories_path
    end

    it "displays all existing categories and their details" do
      expect(page).to have_content("Entertainment")

    end

    it "also should display a delete option that redirects back to index without deleted category " do
      click_link("Delete")

      expect(current_path).to eq(categories_path)

      expect(page).to_not have_content("Entertainment")
    end

    it "also should display an option to edit a specific category" do
      click_link("Edit")

      expect(current_path).to eq(edit_category_path(@entertainment))
    end

    it "also should allow me click into a category specific page to view details" do
      click_link(@entertainment.title)

      expect(current_path).to eq(category_path(@entertainment))

      expect(page).to have_content("Entertainment")
    end

    it "also should allow me to create a new category" do
      click_link("Create Category")

      expect(current_path).to eq(new_category_path)

    end

  end
end
