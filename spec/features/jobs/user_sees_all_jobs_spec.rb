require 'rails_helper'

describe "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "Entertainment")

    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
    company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category: category)

    visit company_path(company)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("QA Analyst")
  end

  it 'displays a delete option taht will delete a specific job and redirect back to job index' do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "Entertainment")


    company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category: category)

    visit company_path(company)

    click_link("Delete")

    expect(current_path).to eq(company_jobs_path(company))
  end
end
