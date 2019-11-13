require 'spec_helper'
require_relative '../../app/models/cab'

describe Cab do
	subject { described_class.new(registration_number: '12322', location: Location.new(longitude: 97, latitude: 19)) }

	describe '.available' do
		before do
			subject.occupy

			Cab.all = [subject]
		end

		it 'returns available cabs' do
			expect(Cab.available).to eq []
		end
	end

	describe '.available' do
		subject { PinkCab.new(registration_number: '12322', location: Location.new(longitude: 97, latitude: 19)) }

		before do
			Cab.all = [subject]
		end

		it 'returns available cabs' do
			expect(Cab.hipster).to eq [subject]
		end
	end

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

	describe '#occupied' do
		it 'returns the occupied' do
			expect(subject.occupied).to eq(false)
		end
	end

	describe '#occupy' do
		before do
			subject.occupy
		end

		it 'sets occupied to true' do
			expect(subject.occupied).to eq(true)
		end
	end

	describe '#hipster?' do
		it 'returns false' do
			expect(subject.hipster?).to eq false
		end
	end	

	describe '#unoccupy' do
		let(:location) { Location.new(latitude: 1, longitude: 167) }

		before do
			subject.occupy

			subject.unoccupy(location)
		end

		it 'sets occupied to false' do
			expect(subject.occupied).to eq(false)
		end

		it 'sets occupied to false' do
			expect(subject.location).to eq(location)
		end
	end	

	describe '#distance_from' do
		let(:location) { Location.new(latitude: 1, longitude: 167) }

		it 'returns the distance from the location passed' do
			expect(subject.distance_from(location)).to eq 72.27724399837061
		end
	end	
end