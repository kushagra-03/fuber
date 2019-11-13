require 'spec_helper'
require_relative '../../app/models/pink_cab'

describe PinkCab do
	subject { described_class.new(registration_number: '12322', location: Location.new(longitude: 97, latitude: 19)) }
	
	describe '#hipster?' do
		it 'returns true' do
			expect(subject.hipster?).to eq true
		end
	end	

end
