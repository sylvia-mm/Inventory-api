# class ApplicationController < ActionController::API
#   include ActionController::Cookies
# end

class ApplicationController < ActionController::API
  skip_before_action :verify_authenticity_token
end
