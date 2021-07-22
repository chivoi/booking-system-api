class BookingsController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_user
  before_action :set_booking, only: [:show, :update, :destroy]

  def user_bookings 
    @bookings = current_user.bookings
    render json: @bookings
  end

  def all_bookings
    @all_bookings = Booking.all
    render json: @all_bookings
  end

  def create 
    @booking = current_user.bookings.create(booking_params)
    if @booking.errors.any?
      render json: @booking.errors, status: :unprocessable_entity
    else
      @booking.timeslot.update(is_blocked: true)
      render json: @booking, status: 201
    end
  end

  def update
    @booking.update(booking_params)
    if @booking.errors.any?
      render json: @booking.errors, status: :unprocessable_entity
    else 
      render json: @booking, status: 201
    end
  end

  def show
    render json: @booking
  end

  def destroy 
    @booking.timeslot.update(is_blocked: false)
    @booking.destroy
    render json: 204
  end

  private

  def booking_params
    params.require(:booking).permit(:timeslot_id, :user_id, :venue, :address, :event_type, :start_time, :duration, :pa_provided, :message)
  end

  def set_booking
    begin
      @booking = Booking.find(params[:id])
    rescue
      render json: {"error": "Booking not found"}, status: 404
    end
  end

end
