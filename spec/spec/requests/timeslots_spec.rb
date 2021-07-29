require 'rails_helper'
require_relative '../factories/timeslots.rb'

RSpec.describe "Timeslots", type: :request do
  describe "GET /timeslots" do
    before(:each) do
      get '/api/timeslots'
    end

    it "should resond with 200" do
      expect(response).to have_http_status(200)
    end
    
    it "should respond with JSON" do
      expect(response.content_type).to eq "application/json; charset=utf-8"
    end
  end


  describe "GET /blocked_timeslots" do
    before(:each) do
      get '/api/blocked_timeslots'
    end

    it "should resond with 200" do
      expect(response).to have_http_status(200)
    end
    
    it "should respond with JSON" do
      expect(response.content_type).to eq "application/json; charset=utf-8"
    end
  end

  # describe "GET /timeslots/:id" do
  
  #   before(:all) do
  #     FactoryBot.create(:timeslot)
  #   end

  #   context "when going to valid id" do
  #     before(:each) do
  #       get '/api/timeslots/100003'
  #     end

  #     it "should resond with 200 with the right id" do
  #       get '/api/timeslots/100003'
  #       expect(response).to have_http_status(200)
  #     end

  #     it "should respond with JSON" do
  #       expect(response.content_type).to eq "application/json; charset=utf-8"
  #     end
  #   end

  #   context "when going to invalid id" do
  #     before(:each) do
  #       get '/api/timeslots/100001'
  #     end

  #     it "should respond with 404 not found" do
  #       expect(response).to have_http_status(404)
  #     end

  #   end
  # end
end