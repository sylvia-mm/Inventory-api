class SessionsController < ApplicationController
  def create
    @admin = Admin.find_by(email: params[:email])
    if @admin&.authenticate(params[:password])
      session[:admin_id] = @admin.id
      render json: @admin, status: :ok
    else
      render json: { error: 'Incorrect email or password' }, status: :unauthorized
    end
  end


end
