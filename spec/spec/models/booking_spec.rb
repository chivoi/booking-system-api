require 'rails_helper'
require_relative '../factories/bookings.rb'

RSpec.describe Booking, type: :model do
  it "has a valid factory" do
    booking = FactoryBot.build(:booking)
    expect(booking).to be_valid
  end
end