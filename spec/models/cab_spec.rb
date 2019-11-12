require 'spec_helper'
require_relative '../../app/models/cab'

describe Cab do
	subject { described_class.new(registration_number: '12322', longitude: 123231, latitude: 123213) }

	describe '#registration_number' do
		it 'returns the registration_number' do
			expect(subject.registration_number).to eq '12322'
		end
	end

	describe '#longitude' do
		it 'returns the longitude' do
			expect(subject.longitude).to eq 123231
		end
	end

	describe '#latitude' do
		it 'returns the latitude' do
			expect(subject.latitude).to eq 123213
		end
	end
end