class AdminsController < ApplicationController
    before_action :authorize, except: [:create]
  
    def create
      @admin = Admin.new(admin_params)
      if @admin.save
        session[:admin_id] = @admin.id
        render json: @admin, status: :created
      else
        render json: @admin.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def admin_params
      params.require(:admin).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
  
    def authorize
      return head :unauthorized unless session[:admin_id]
    end
end
  