class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create, :logged_in]
  skip_before_action :verify_authenticity_token

  def create
    admin = Admin.find_by(email: params[:email])
    
    if admin && admin.authenticate(params[:password])
      if Admin::AUTHORIZED_USERS.include?(admin.email)
        session[:admin_id] = admin.id
        render json: { message: 'Login successful' }, status: :ok
      else
        render json: { error: 'Unauthorized! Unauthorized!' }, status: :unauthorized
      end
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def show
    @admin = Admin.find(session[:admin_id])
    if @admin
      render json: {first_name: @admin.first_name, last_name: @admin.last_name, email: @admin.email}, status: :ok
    else
      head :unauthorized
    end
  end 
  
  def destroy
    session[:admin_id] = nil
    # render json: { message: "Logged out!!"}
    head :no_content
  end

end
