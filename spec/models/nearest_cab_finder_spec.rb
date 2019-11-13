require 'spec_helper'
require_relative '../../app/models/nearest_cab_finder'

describe NearestCabFinder do
	describe '#search' do
		let(:location) { Location.new(latitude: 17, longitude: 100) }

		let!(:cab) { Cab.new(registration_number: '1', location: Location.new(longitude: 123231, latitude: 123213)) }
		let!(:other_cab) { Cab.new(registration_number: '2', location: Location.new(longitude: 231, latitude: 3213)) }

		subject { described_class.new(location: location, cabs: [cab, other_cab]) }
		
		it 'returns the cab with the minimum location to the supplied distance' do
			expect(subject.search).to eq other_cab
		end	
	end
end
