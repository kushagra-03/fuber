require 'sinatra'
require 'json'
require 'pry'

class Fuber < Sinatra::Base

	before do
	  content_type :json
	end

	get '/' do
		'Welcoome to Fuber'
	end

  post '/bookings' do
		@booking = ::Booking.new(**params)

		if @booking
			status '201'
			@booking.to_json
		end
	end
end

#run Fuber.run!