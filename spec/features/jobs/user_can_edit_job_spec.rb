require "rails_helper"

describe "As a user" do
  describe "I can click edit" do
    before :each do
      @company = Company.create(name: "ESPN")
      @category = Category.create(title: "Sports Entertainment")
      @job = @company.jobs.create(title: "Financial Analyst", description: "Penny Pusher", level_of_interest: 99, city: "Denver", category: @category)
      @contact = Contact.new
    end

    # it "from job index page and displays form fields with a submit button that redirects to show page" do
    #   visit company_jobs_path(@company)
    #
    #   click_link("Edit")
    #
    #   expect(current_path).to eq(edit_company_job_path(@company,@job))
    #
    #   fill_in"job[title]", with: "Sports Analyst"
    #   fill_in"job[description]", with: "Sports"
    #   fill_in"job[level_of_interest]", with: 35
    #   fill_in"job[city]", with: "San Francisco"
    #   select("Sports Entertainment", from: "job_category_id").select_option
    #
    #   click_button("Submit")
    #
    #   expect(current_path).to eq(company_job_path(@company, @job))
    # end

    it 'from job show page and displays form fields with submit button that redirects to shwo page' do
      visit company_job_path(@company, Job.last.id)

      click_link("Edit")

      expect(current_path).to eq(edit_company_job_path(@company,@job))

      fill_in"job[title]", with: "Sports Analyst"
      fill_in"job[description]", with: "Sports"
      fill_in"job[level_of_interest]", with: 35
      fill_in"job[city]", with: "San Francisco"
      select("Sports Entertainment", from: "job_category_id").select_option

      click_button("Submit")

      expect(current_path).to eq(company_job_path(@company, @job))
    end
  end
end
