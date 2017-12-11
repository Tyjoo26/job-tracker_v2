require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "Validations" do
    context "invalid attributes" do
      xit "will return invalid if you save a category without a title" do
        category = Category.new()

        expect(category).to be_invalid
      end

      xit "has a unique title" do
        Category.create(title: "Entertainment")
        category = Category.new(title: "Entertainment")
        expect(category).to be_invalid
      end
    end

    context 'Valid attributes' do
      xit 'will return valid' do
        category = Category.create(title: "Entertainment")
        expect(category).to be_valid
      end
    end
  end

  describe "Relationships" do
    xit "has many jobs" do
      category = Category.new(title: "Entertainment")
      expect(category).to respond_to(:jobs)
    end
  end
end
