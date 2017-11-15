class BookingsController < ApplicationController

	def new
		@booking = Booking.new
		@flight = Flight.find(white_params[:flight_id])
		@passengers = []
		white_params[:passengers].to_i.times do |p|
			@passengers << Passenger.new
		end
	end

	def create
		flight = Flight.find(params[:booking][:flight_id])
		booking = flight.bookings.create()
		passengers = white_params[:booking][:passenger]
		passengers.each do |p|
			passenger = booking.passengers.create(name:p[:name], email:p[:email])
			PassengerMailer.thank_you_email(passenger, flight).deliver_later
		end

		redirect_to booking
	end

	def show
		@booking = Booking.find_by(id:params[:id])
	end

	private
	def white_params
		params.permit(:passengers, :flight_id, booking:
			{passenger: [:name, :email]})
	end
end
