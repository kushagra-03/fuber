require 'spec_helper'
set :environment, :test


describe Fuber do
	include Rack::Test::Methods

	def app
	  Fuber
	end

	describe '#GET /' do
		it 'returns status 200 OK' do
			get '/'

			expect(last_response.status).to eq 200
		end
	end
end