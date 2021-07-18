class ApplicationController < ActionController::API
  include Knock::Authenticable

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { render json: {"Error": "Unauthorized", "Message": "#{exception.message}"}, status: 401 }
    end
  end
end
