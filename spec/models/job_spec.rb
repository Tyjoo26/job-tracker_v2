require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      before :each do
        @category = Category.create(title: "Entertainment")
        @company = Company.create(name: "ESPN")
      end

      it "is invalid without a title" do
        job = @company.jobs.new(level_of_interest: 80, description: "Wahoo", city: "Denver", category: @category)

        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = @company.jobs.new(title: "Developer", description: "Wahoo", city: "Denver", category: @category)
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = @company.jobs.new(title: "Developer", description: "Wahoo", level_of_interest: 80, category: @category)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, and company" do
        company = Company.new(name: "Turing")
        category = Category.create(title: "Entertainment")

        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category: category)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end

    it "belongs to a category" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")

      expect(job).to respond_to(:category)
    end

    it "has many comments" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")

      expect(job).to respond_to(:comments)
    end
  end
end
