class UsersController < ApplicationController
    before_action :authorize
    before_action :find_user, only: [:show, :update]


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
