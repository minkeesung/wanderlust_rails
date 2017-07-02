module Api
  class PostController < ApplicationController

    before_action :set_trip, only: [:show, :destroy]

    def index
        render json: Trip.all
    end

    def create
    end

    def show
    end

    def distroy
    end

    private
    def set_trip
        @trip = Trip.find(params[:id])
    end

    def trip_params
        params.permit(:budget, :origin, :date, :password, :booked?, :user_id)
    end

  end
end
