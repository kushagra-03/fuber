require 'spec_helper'
require_relative '../../app/models/booking'

describe Booking do
	subject { described_class.new(customer: customer, cab: cab) }

	describe '#customer' do
		let!(:customer) { Customer.new(customer_id: 1, longitude: 100001, latitude: 100002) }

		it 'returns the customer' do
			expect(subject.customer).to eq customer
		end
	end

	describe '#cab' do
		let!(:cab) { Cab.new(registration_number: 1, longitude: 100001, latitude: 100002) }

		it 'returns the cab' do
			expect(subject.cab).to eq cab
		end
	end
end