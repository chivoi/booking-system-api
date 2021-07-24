class TimeslotsController < ApplicationController
  load_and_authorize_resource
  before_action :set_timeslot, only: [:update]

  def index
    @timeslots = Timeslot.where(is_blocked: false).and(Timeslot.where(date:Date.today..Float::INFINITY)).order(created_at: :asc)
    render json: @timeslots
  end

  def blocked_timeslots
    @blocked_timeslots = Timeslot.where(is_blocked: true).order(created_at: :asc)
    render json: @blocked_timeslots
  end

  def show
    render json: @timeslot
  end

  def update
    if current_user.is_admin
      @timeslot.update(timeslot_params)
      if @timeslot.errors.any?
        render json: @timeslot.errors, status: :unprocessable_entity
      else 
        render json: @timeslot, status: 201
      end
    else
      render json: {"Error": "You don't have permission to do that"}, status: 401
    end
  end

  def get_by_params
    @timeslot = Timeslot.search(params[:date], params[:half_day])
    puts "THIS IS #{@timeslot.to_s}"
    if @timeslot
      render json: @timeslot
    else
      render json: {"Error": "Timeslot not found"}, status: 404
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
