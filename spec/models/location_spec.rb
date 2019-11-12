require 'spec_helper'
require_relative '../../app/models/location'

describe Location do
	subject { described_class.new(latitude: 100001, longitude: 100002) }

	describe '#latitude' do
		it 'returns the latitude' do
			expect(subject.latitude).to eq 100001
		end
	end

	describe '#longitude' do
		it 'returns the longitude' do
			expect(subject.longitude).to eq 100002
		end
	end

	describe '#distance_from other_location' do
		let(:location) { described_class.new(latitude: 100040, longitude: 100090) }

		it 'returns the distance from the other location' do
			expect(subject.distance_from(location)).to eq 11.2694
		end
	end
end

