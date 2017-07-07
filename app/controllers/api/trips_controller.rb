module Api
  class TripsController < ApplicationController

    before_action :set_trip, only: [:show, :destroy]

    def index
        render json: {trips: Trip.all}
    end

    def create

        @trip = Trip.new(trip_params)
        if @trip.save
            render json: @trip, status: 201
        else

            render json: { errors: @trip.errors.full_messages }, status: 422
        end
    end

    def show
    end

    def destroy
        @trip.destroy
        render :show, status: :ok
    end

    private
    def set_trip
        @trip = Trip.find(params[:id])
    end

    def trip_params
        params.require(:trip).permit(:budget, :origin, :date, :passengers)
    end

  end
end
