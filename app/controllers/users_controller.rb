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

  def log_in
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      auth_token = Knock::AuthToken.new payload: {sub: @user.id}
      render json: {username: @user.email, jwt: auth_token.token, first_name: @user.first_name, last_name: @user.last_name, phone_num: @user.phone_num}, status: 200
    else
      render json: {error: "Incorrect username or password"}, status: 404
    end
  end

  def update
    begin
      current_user.update(user_params)
      if current_user.save 
        render json: {
          first_name: current_user.first_name, 
          last_name: current_user.last_name,
          phone_num: current_user.phone_num,
          email: current_user.email,
        }
      else
        render json: {"error": "Contact details did not update"}, status: :unprocessable_entity
      end
    rescue
      render json: {"error": "You don't have permission to do this"}, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      current_user.destroy
      render json: 204
    rescue
      render json: {"error": "You don't have permission to do this"}
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :phone_num, :is_admin, :password, :password_confirmation)
  end

end