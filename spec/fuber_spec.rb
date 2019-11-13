require 'spec_helper'
set :environment, :test


describe Fuber do
	include Rack::Test::Methods

	def app
	  Fuber
	end

	describe '#POST /bookings' do
		context 'when booking is created successfully' do
			context 'when booking is not hipster' do
				let!(:cab) { Cab.new(registration_number: '1', location: Location.new(longitude: 123231, latitude: 123213)) }
				let!(:other_cab) { Cab.new(registration_number: '2', location: Location.new(longitude: 231, latitude: 3213)) }
				let!(:another_cab) { Cab.new(registration_number: '3', location: Location.new(longitude: 230, latitude: 3210)) }

				let(:json_response) { JSON.load(last_response.body) }

				before do
					another_cab.occupy
					Cab.all = [cab, other_cab, another_cab]

					post '/bookings', customer_id: 1, hipster: false
				end

				it 'returns status created' do
					expect(last_response.status).to eq 201
				end

				it 'returns the booking created' do
					expect(json_response['cab']).to eq '2'
					expect(json_response['customer']).to eq '1'
				end
			end

			context 'when booking is hipster' do
				let!(:cab) { Cab.new(registration_number: '1', location: Location.new(longitude: 123231, latitude: 123213)) }
				let!(:other_cab) { Cab.new(registration_number: '2', location: Location.new(longitude: 231, latitude: 3213)) }
				let!(:pink_cab) { PinkCab.new(registration_number: '3', location: Location.new(longitude: 231, latitude: 3213)) }

				let(:json_response) { JSON.load(last_response.body) }

				before do
					Cab.all = [cab, other_cab, pink_cab]

					post '/bookings', customer_id: 1, hipster: true
				end

				it 'returns status created' do
					expect(last_response.status).to eq 201
				end

				it 'returns the booking created' do
					expect(json_response['cab']).to eq '3'
					expect(json_response['customer']).to eq '1'
				end
			end
		end

		context 'when booking is not created' do
			
			let!(:cab) { Cab.new(registration_number: '12322', location: Location.new(longitude: 123231, latitude: 123213)) }
			let!(:other_cab) { Cab.new(registration_number: '12329', location: Location.new(longitude: 231, latitude: 3213)) }

			let(:json_response) { JSON.load(last_response.body) }

			before do
				Cab.all = [cab, other_cab]

				post '/bookings', hipster: false
			end

			it 'returns status unprocessible entity' do
				expect(last_response.status).to eq 422
			end
		end
	end

	describe '#PUT bookings/:customer_id' do
		context 'when booking is updated' do
			let!(:cab) { Cab.new(registration_number: '1', location: Location.new(longitude: 123231, latitude: 123213)) }
			let!(:other_cab) { Cab.new(registration_number: '2', location: Location.new(longitude: 231, latitude: 3213)) }
			let!(:another_cab) { Cab.new(registration_number: '3', location: Location.new(longitude: 230, latitude: 3210)) }
			let!(:booking) { Booking.new(customer: Customer.find('1')) }
			let(:json_response) { JSON.load(last_response.body) }

			before do
				another_cab.occupy
				Cab.all = [cab, other_cab, another_cab]

				booking.locate_cab(cabs: Cab.available)

				Booking.all = [booking]
				put '/bookings/1'
			end

			it 'returns status updated' do
				expect(last_response.status).to eq 200

				expect(json_response['cab']).to eq '2'
				expect(json_response['customer']).to eq '1'
			end
		end

		context 'when booking is not updated' do
			let!(:booking) { Booking.new(customer: Customer.find('1')) }
			let(:json_response) { JSON.load(last_response.body) }

			before do
				Booking.all = [booking]
				put '/bookings/2'
			end

			it 'returns status not found' do
				expect(last_response.status).to eq 404
			end
		end
	end
end