require 'date'
class FlightsController < ApplicationController
	def index
		@airports = Airport.pluck(:code)
		@starts = Flight.pluck(:start).map{|d| d.strftime("%B %d %Y, %I:%M %p")}
		@passengers = 1..4

		if !search_params.empty?
			@flights = Flight.where("to_airport_id = ? AND from_airport_id = ? AND start = ?", 
								 Airport.find_by(code: search_params[:to_airport]), 
								 Airport.find_by(code: search_params[:from_airport]), 
								 search_params[:start].to_datetime)
		end
	end

	private
		def search_params
			params.permit(:to_airport, :from_airport, :start, :passengers)
		end
end
