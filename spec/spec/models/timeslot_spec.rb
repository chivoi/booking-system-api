require 'rails_helper'
require_relative '../factories/timeslots.rb'

RSpec.describe Timeslot, type: :model do
  it "has a valid factory" do
    timeslot = FactoryBot.build(:timeslot)
    expect(timeslot).to be_valid
  end
end