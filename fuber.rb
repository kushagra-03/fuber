require 'sinatra'
require 'json'
require 'cmath'
require 'pry'
require './app/models/customer'
require './app/models/location'
require './app/models/nearest_cab_finder'
require './app/models/booking'
require './app/models/cab'
require './app/models/pink_cab'

class Fuber < Sinatra::Base

	before do
	  content_type :json
	end

  post '/bookings' do
  	@customer = ::Customer.find(params[:customer_id])

  begin
		@booking = ::Booking.new(customer: @customer)
	rescue ::Booking::NilCustomerSupplied
		render_booking_not_created
	else
		@booking.locate_cab(cabs: ::Cab.available, hipster: hipster?)

		if @booking.fulfilled?
			status '201'
			@booking.to_json
		else
			render_booking_not_created
		end
	end
	end

  put '/bookings/:customer_id' do
  	@booking = Booking.all.find { |booking| booking.customer.id == params[:customer_id]}

  	if @booking
  		status '200'
  		@booking.end
  		@booking.to_json
  	else
  		render_booking_not_found
  	end
	end

	private

	def hipster?
		params[:hipster] == 'true'
	end

	def render_booking_not_found
		status '404'
		{ message: "Booking could not be found" }.to_json
	end

	def render_booking_not_created
		status '422'
		{ message: "Booking could not be created" }.to_json
	end
end