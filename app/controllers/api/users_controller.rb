module Api
  class UsersController < ApplicationController

    before_action :set_user, only: [:show, :destroy]

    def index
        render json: {users: User.all}
    end

    def create

        @user = User.new(user_params)
        if @user.save
            render json: @user, status: 200
        else
          render json: { errors: @user.errors.full_messages }, status: 422
        end
    end

    def show
    end

    def destroy
        @user.destroy
        render :show, status: :ok
    end

    private
    def set_user
        @user = User.find(params[:id])
    end

    def user_params

        params.permit(:name, :email, :password)
    end

  end
end
