class ClientsController < ApplicationController
  before_action :clients_with_bookings, only: [:index]
  before_action :set_client, only: [:show, :client_bookings]

  def index
    render json: @clients
  end

  def show
    render json: @client
  end

  def my_details
    if current_user
      render json: {
        first_name: current_user.first_name, 
        last_name: current_user.last_name,
        phone_num: current_user.phone_num,
        email: current_user.email
      }
    else
      render json: {"error": "User not found"}, status: 404
    end
  end

  def client_bookings 
    render json: @client.bookings
  end

  private

  def clients_with_bookings
    authorize! :read, @clients
    @clients = Booking.all.map{|booking| booking.user}.uniq
  end

  def clients_no_bookings
    authorize! :read, @clients
    @clients =  User.all.filter{|user| user.bookings.empty?}.uniq
  end

  def user_params
    params.permit(:first_name, :last_name, :email, :phone_num)
  end

  def set_client
    authorize! :read, @client
    begin
      @client = User.find(params[:id])
    rescue
      render json: {"error": "User not found"}, status: 404
    end
  end
end
