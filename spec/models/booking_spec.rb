require 'spec_helper'
require_relative '../../app/models/booking'

describe Booking do
	subject { described_class.new(customer: customer, cab: cab) }

	let!(:customer) { Customer.new(customer_id: 1, longitude: 100001, latitude: 100002) }
	let!(:cab) { Cab.new(registration_number: 1, longitude: 100001, latitude: 100002) }
	

	describe '#customer' do
		it 'returns the customer' do
			expect(subject.customer).to eq customer
		end
	end

	describe '#cab' do
		it 'returns the cab' do
			expect(subject.cab).to eq cab
		end
	end
end