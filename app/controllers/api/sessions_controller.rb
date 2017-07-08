module Api
  class SessionsController < ApplicationController
    def create

      @user = User.find_by_credentials(
        params[:email],
        params[:password]
      )

      if @user
        session[:session_token] = @user.reset_token
        render json: @user, status: 200 
      else
        render json: ["Invalid login credentials"], status: 401
      end
    end

    def destroy
      @user = current_user

      if @user
        logout
        render json: {}
      else
        render json: ["Nobody signed in"], status: 404
      end
    end
  end
end
