require 'rails_helper'

RSpec.describe "Comments" do
  context "Validations" do
    it "will be invalid without content " do
      comment = Comment.new

      expect(comment).to be_invalid
    end

    it "will be valid with content" do
      comment = Comment.new(content: "FOR SUUUUUURE")

      expect(comment).to be_valid
    end
  end

  describe "Relationships" do
    it "belongs to job" do
      comment = Comment.new(content: "FOR SUUUUUURE")
      expect(category).to respond_to(:job)
    end
  end
end
