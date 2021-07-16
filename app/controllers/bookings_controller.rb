class BookingsController < ApplicationController

  def user_bookings 
    @bookings = current_user.bookings
    render json: @bookings
  end

  def all_bookings
    @all_bookings = Booking.all
    render json: @all_bookings
  end


end
