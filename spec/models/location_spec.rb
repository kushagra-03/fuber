require 'spec_helper'
require_relative '../../app/models/location'

describe Location do
	subject { described_class.new(latitude: 100001, longitude: 100002) }

	describe '#latitude' do
		it 'returns the latitude' do
			expect(subject.latitude).to eq latitude
		end
	end

	describe '#longitude' do
		it 'returns the longitude' do
			expect(subject.longitude).to eq longitude
		end
	end
end

