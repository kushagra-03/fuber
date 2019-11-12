require 'sinatra'

class Fuber < Sinatra::Base
	get '/' do
		'Welcoome to Fuber'
	end

  get '/bookings' do
		'List of all bookings'
	end
end

#run Fuber.run!