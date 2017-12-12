require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "Validations" do
    context "invalid attributes" do
      it "will return invalid if you save a category without a title" do
        category = Category.new()

        expect(category).to be_invalid
      end

      it "has a unique title" do
        Category.create(title: "Entertainment")
        category = Category.new(title: "Entertainment")
        expect(category).to be_invalid
      end
    end

    context 'Valid attributes' do
      it 'will return valid' do
        category = Category.create(title: "Entertainment")
        expect(category).to be_valid
      end
    end
  end

  describe "Relationships" do
    it "has many jobs" do
      category = Category.new(title: "Entertainment")
      expect(category).to respond_to(:jobs)
    end
  end
end
