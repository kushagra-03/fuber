require 'spec_helper'
require_relative '../../app/models/customer'

describe Customer do
	subject { described_class.new(id: '12322', location: Location.new(longitude: 123231, latitude: 123213)) }

	describe '.find' do
		it 'returns the customer with the supplied id' do
			expect(described_class.find('1').id).to eq '1'
		end
	end

	describe '#id' do
		it 'returns the id' do
			expect(subject.id).to eq '12322'
		end
	end

	describe '#location' do
		it 'returns the location' do
			expect(subject.location).to be_a(Location)
		end
	end
end