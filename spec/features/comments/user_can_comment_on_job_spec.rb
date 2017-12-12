require "rails_helper"

describe "As a user" do
  describe "when i go to jobs show page" do
    before :each do
      @category = Category.create(title: "Entertainment")
      @company = Company.create(name: "ESPN")
      @job = @company.jobs.create(title: "Financal Analyst", description: "Penny Pusher", level_of_interest: 90, city: "Denver", category: @category)

      visit company_job_path(@company, @job)
    end

    it "displays a form where I can submit a comment and it will redirect me to that show page with displayed content" do
      expect(page).to have_content("ESPN")

      fill_in"comment[content]", with: "THIS IS A GREAT JOB WOO HOOO!!!"

      click_button("Post Comment")

      expect(current_path).to eq(company_job_path(@company, @job))
    end
  end
end
