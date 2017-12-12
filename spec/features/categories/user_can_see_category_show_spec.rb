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

    it "also displays all the jobs associated with this specific category" do
      @entertainment = Category.create(title: "Entertainment")
      @company = Company.create(name: "ESPN")

      @job = @company.jobs.create(title: "Financial Analyst", description: "Penny Pusher", level_of_interest: 80, city: "Denver", category: @entertainment)

      @job_2 = @company.jobs.create(title: "Sports Analyst", description: "Sports Pusher", level_of_interest: 32, city: "NYC", category: @entertainment)

      visit category_path(@entertainment)

      expect(page).to have_content("Financial Analyst")
      expect(page).to have_content("Sports Analyst")
      expect(page).to have_content("Penny Pusher")
      expect(page).to have_content("Sports Pusher")
      expect(page).to have_content("Denver")
      expect(page).to have_content("NYC")

    end
  end
end
