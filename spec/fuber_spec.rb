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

	describe '#POST /bookings' do
		context 'when booking is created successfully' do
			
			let(:cab) { Cab.new(registration_number: '12322', longitude: 123231, latitude: 123213) }
			let(:customer) { Customer.new(customer_id: 1, longitude: 100001, latitude: 100002) }

			before do
				post '/bookings', params: { customer_id: 1, hipster: false }
			end

			it 'returns status created' do
				expect(last_response.status).to eq :created
			end
		end
	end
end