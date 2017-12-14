require 'rails_helper'

describe "User sees one company" do
  scenario "a user sees a company" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "Entertainment")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category: category)

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
  end

  it "also displays a form for a user to submit a contact for that company" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "Entertainment")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category: category)

    visit company_path(company)

    fill_in"contact[full_name]", with: "Will Ferrell"
    fill_in"contact[position]", with: "Hiring Manager"
    fill_in"contact[email]", with: "will@yogi.com"

    click_button("Post Contact")

    expect(current_path).to eq(company_path(company))
  end
end
