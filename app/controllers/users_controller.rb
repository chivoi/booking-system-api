class UsersController < ApplicationController
  
  def create 
    @user = User.create(user_params)
    if @user.save
      auth_token = Knock::AuthToken.new payload: {sub: @user.id}
      render json: {username: @user.email, jwt: auth_token.token}, status: 201
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :phone_num, :is_admin, :password, :password_confirmation)
  end

end