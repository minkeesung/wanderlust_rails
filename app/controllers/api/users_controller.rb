module Api
  class UsersController < ApplicationController

    before_action :set_user, only: [:show, :destroy]

    def index
        render json: {users: User.all}
    end

      def create
    @user = User.new(user_params)

    if @user.save
      session[:session_token] = @user.reset_token
      render json: @user, status: 200 
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def update
    @user = current_user

    if @user.update
      render :show
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  private

  def user_params
    params.permit(:email, :password, :name)
  end

  end
end
