class AdminsController < ApplicationController
    before_action :authorize, except: [:create]
  
    private

    def authorize
      return head :unauthorized unless session[:admin_id]
    end
end
  