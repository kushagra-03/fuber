require 'spec_helper'
require_relative '../../app/models/cab'

describe Cab do
	subject { described_class.new(registration_number: '12322', location: Location.new(longitude: 123231, latitude: 123213)) }

	describe '#registration_number' do
		it 'returns the registration_number' do
			expect(subject.registration_number).to eq '12322'
		end
	end

	describe '#location' do
		it 'returns the location' do
			expect(subject.location).to be_a(Location)
		end
	end
end