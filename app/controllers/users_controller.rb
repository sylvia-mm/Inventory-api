class UsersController < ApplicationController
    before_action :authorize
    before_action :find_user, only: [:show, :update]

    def index
        @users = User.all
        render json: @users
    end

    def show
        if @user
            render json: @user, include: :products
        else
            render json: {message: "User not found"}, status: :not_found
        end
    end

    def create
        @user = User.create(user_params)
        render json: @user, status: :created
    end


    private

    def find_user
        @user = User.find_by(id: params[:id])
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :department)
    end

    def authorize
      return head :unauthorized unless session[:admin_id]
    end
end
