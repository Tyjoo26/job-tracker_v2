require 'rails_helper'

RSpec.describe "Comments" do
  context "Validations" do
    it "will be invalid without content " do
      company = Company.create(name: "ESPN")
      category = Category.create(title: "JOKE")
      job = Job.create(title: "GINGA NINJA", description: "CHUCK NORRIS", level_of_interest: 99, city: "Denver", company: company, category: category)
      comment = Comment.new(job: job)

      expect(comment).to be_invalid
    end

    it "will be invalid without job associated with ti" do
      company = Company.create(name: "ESPN")
      category = Category.create(title: "JOKE")
      job = Job.create(title: "GINGA NINJA", description: "CHUCK NORRIS", level_of_interest: 99, city: "Denver", company: company, category: category)

      comment = Comment.new(content: "shh")
    end

    it "will be valid with content" do
      job = Job.new(title: "Analyst", description: "Financial", level_of_interest: 90, city: "Denver")
      comment = Comment.new(content: "FOR SUUUUUURE", job: job)

      expect(comment).to be_valid
    end
  end

  describe "Relationships" do
    it "belongs to job" do
      comment = Comment.new(content: "FOR SUUUUUURE")
      expect(comment).to respond_to(:job)
    end
  end
end
