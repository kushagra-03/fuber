require 'spec_helper'
require_relative '../../app/models/location'

describe Location do
	subject { described_class.new(latitude: 17, longitude: 100) }

	describe '#latitude' do
		it 'returns the latitude' do
			expect(subject.latitude).to eq 17
		end
	end

	describe '#longitude' do
		it 'returns the longitude' do
			expect(subject.longitude).to eq 100
		end
	end

	describe '#distance_from other_location' do
		let(:location) { described_class.new(latitude: -88, longitude: -99) }

		it 'returns the distance from the other location' do
			expect(subject.distance_from(location)).to eq (225.00222221124838)
		end
	end
end

