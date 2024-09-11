# class ApplicationController < ActionController::API
#   include ActionController::Cookies
# end
# class ApplicationController < ActionController::Base
#     protect_from_forgery with: :exception
#     before_action :require_login
  
#     helper_method :current_admin, :logged_in?
  
#     private
  
  #   def current_user
  #     @current_admin ||= User.find(session[:admin_id]) if session[:admin_id]
  #   end
  
  #   def logged_in?
  #     !!current_admin
  #   end
  
  #   def require_login
  #     unless logged_in?
  #       render json: { status: 'error', message: 'Unauthorized' }, status: :unauthorized
  #     end
  #   end
  # end

class ApplicationController < ActionController::API
   skip_before_action :verify_authenticity_token
end

  