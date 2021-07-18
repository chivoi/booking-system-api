class ApplicationController < ActionController::API
  include Knock::Authenticable
  include ActionController::MimeResponds

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { render json: {"Error": "Access denied"}, status: 401 }
      format.html { render json: {"Error": "Access denied"}, status: 401 }
    end
  end
end
