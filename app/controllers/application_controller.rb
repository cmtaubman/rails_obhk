class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :get_current_user
  protect_from_forgery with: :null_session

  # Just use default (:null_session) for this super simple app
  #protect_from_forgery

  # before_action :set_current_user
  def authenticate_current_user
    render json: {message: "Unauthorize"} if get_current_user.nil?
  end

  def get_current_user
    return nil unless cookies[:authHeaders]
    auth_headers = JSON.parse cookies[:authHeaders]

    expiration_datetime = DateTime.strptime(auth_headers["expiry"], "%s")
    current_user = User.find_by(uid: auth_headers["uid"])

    if current_user &&
       current_user.tokens.has_key?(auth_headers["client"]) &&
       expiration_datetime > DateTime.now

      @current_user = current_user
    end
    @current_user
  end

  private

  def set_current_user
    @current_user = User.find(1)
  end
end