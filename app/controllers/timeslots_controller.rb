class TimeslotsController < ApplicationController
  load_and_authorize_resource
  before_action :set_timeslot, only: [:update]

  def update
    @timeslot.update(timeslot_params)
    if @timeslot.errors.any?
      render json: @timeslot.errors, status: :unprocessable_entity
    else 
      render json: @timeslot, status: 201
    end
  end
  
  private

  def timeslot_params
    params.require(:timeslot).permit(:date, :half_day, :is_blocked)
  end

  def set_timeslot
    begin 
      @timeslot = Timeslot.find(params[:id])
    rescue
      render json: {"error": "Timeslot not found"}, status: 404
    end
  end
end
