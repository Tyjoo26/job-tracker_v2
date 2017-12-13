require 'rails_helper'

RSpec.describe Contact, type: :model do
  context "validations" do
    it "can't save a contact without a full_name" do
      company = Company.create(name: "ESPN")
      contact = Contact.new(email: "Tyj21@gmail.com", position: "Cheetah", company: company)

      expect(contact).to be_invalid
    end

    it "can't save a contact without an email" do
      company = Company.create(name: "ESPN")
      contact = Contact.new(full_name: "TYJOO", position: "Cheetah", company: company)

      expect(contact).to be_invalid
    end

    it "cant save a contact without a position" do
      company = Company.create(name: "ESPN")
      contact = Contact.new(full_name: "TYJOO", email: "TYJOO21@gmail.com", company: company)

      expect(contact).to be_invalid
    end

    it "can't save without a company associated with a contact" do
      company = Company.create(name: "ESPN")

      contact = Contact.new(full_name: "TYJOO", email: "TYJO21@gmail.com", position: "SDflkjasdf")

      expect(contact).to be_invalid
    end

    it "can save a contact with all the valid attributes and associated company" do
      company = Company.create(name: "ESPN")
      contact = Contact.new(full_name: "TYjoo", email: "tyjo21@gmail.com", position: "asdfasd", company: company)

      expect(contact).to be_valid
    end
  end
end
