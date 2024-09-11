# class ApplicationController < ActionController::API
#   include ActionController::Cookies
# end


class ApplicationController < ActionController::Base
  # Skip CSRF protection if your application is an API-only application
  # protect_from_forgery with: :exception

  before_action :require_login

  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def logged_in?
    !!current_user
  end

  def require_login
    unless logged_in?
      render json: { status: 'error', message: 'Unauthorized' }, status: :unauthorized
    end
  end
end
