class ApplicationController < ActionController::API
  include ActionController::Cookies

  before_action :require_login

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_login
    render json: { message: 'Unauthorized' }, status: :unauthorized unless logged_in?
  end
end
