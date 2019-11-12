require 'spec_helper'
require_relative '../../app/models/customer'

describe Customer do
	subject { described_class.new(id: '12322', longitude: 123231, latitude: 123213) }

	describe '#id' do
		it 'returns the id' do
			expect(subject.id).to eq '12322'
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