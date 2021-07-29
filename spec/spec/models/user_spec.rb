require 'rails_helper'
require_relative '../factories/users.rb'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  context "validations" do
    it "is invalid without an email" do
      user = FactoryBot.build(:user, email: nil)
      expect(user).to_not be_valid
    end
    it "is invalid without a phone number" do
      user = FactoryBot.build(:user, phone_num: nil)
      expect(user).to_not be_valid
    end
    it "is invalid without a first name" do
      user = FactoryBot.build(:user, first_name: nil)
      expect(user).to_not be_valid
    end
    it "is invalid without a last name" do
      user = FactoryBot.build(:user, last_name: nil)
      expect(user).to_not be_valid
    end
    it "is invalid with wrong email format" do
      user = FactoryBot.build(:user, email: "slkjflskjgsdlkfjg")
      expect(user).to_not be_valid
    end
    it "is invalid with too short phone number" do
      user = FactoryBot.build(:user, phone_num: 000)
      expect(user).to_not be_valid
    end
    it "is invalid with too long phone number" do
      user = FactoryBot.build(:user, phone_num: 1234566786654323)
      expect(user).to_not be_valid
    end
    it "is invalid with non-digits in phone number" do
      user = FactoryBot.build(:user, phone_num: "Whooooaaa")
      expect(user).to_not be_valid
    end
  end
end