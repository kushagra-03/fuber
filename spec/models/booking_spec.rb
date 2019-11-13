require 'spec_helper'
require_relative '../../app/models/booking'

describe Booking do
	subject { described_class.new(customer: customer) }

	let!(:customer) { Customer.new(id: 1, location: Location.new(longitude: 100001, latitude: 100002)) }
	let!(:cab) { Cab.new(registration_number: 1, location: Location.new(longitude: 100001, latitude: 100002)) }


	describe '#customer' do
		it 'returns the customer' do
			expect(subject.customer).to eq customer
		end
	end

	describe '#cab' do
		it 'returns the cab' do
			expect(subject.cab).to eq nil
		end
	end

	describe '#status' do
		it 'returns the status' do
			expect(subject.status).to eq 'searching'
		end
	end

	describe '#locate_cab' do
		context 'when cabs are empty' do
			it 'returns nil' do
				expect(subject.locate_cab).to eq nil
			end
		end

		context 'when cabs are present' do
			context 'when hipster is set to true' do
				context 'when hipster cab is not present' do
					it 'returns nil' do
						expect(subject.locate_cab(cabs: [cab], hipster: true)).to eq nil
					end
				end
				
				context 'when hipster cab is present' do
					let!(:other_cab) { PinkCab.new(registration_number: 1, location: Location.new(longitude: 100001, latitude: 100002)) }

					it 'returns nil' do
						expect(subject.locate_cab(cabs: [cab, other_cab], hipster: true)).to eq other_cab
					end

					it 'changes the status to occupied of the cab' do
						subject.locate_cab(cabs: [cab, other_cab], hipster: true)
						expect(other_cab.occupied).to eq true
					end

					it 'changes the status to ongoing' do
						subject.locate_cab(cabs: [cab, other_cab], hipster: true)
						expect(subject.status).to eq 'ongoing'
					end	
				end
			end
		end
	end

	describe '#end' do
		context 'when no cab is present' do
			it 'should return false' do
				expect(subject.end).to eq false
			end
		end

		context 'when cab is present' do
			before do
				subject.locate_cab(cabs: [cab])
			end

			it 'returns true' do
				expect(subject.end).to eq true
			end

			it 'unoccupies the cab' do
				subject.end
				expect(subject.cab.occupied).to eq false
			end

			it 'changes the status to ended' do
				subject.end
				expect(subject.status).to eq 'ended'
			end
		end
	end

	describe '#fulfilled?' do
		context 'when cab is nil' do
			it 'returns false' do
				expect(subject.fulfilled?).to eq false
			end
		end

		context 'when both are not nil' do
			subject { described_class.new(customer: customer) }

			before do
				subject.locate_cab(cabs: [cab])
			end

			it 'returns false' do
				expect(subject.fulfilled?).to eq true
			end
		end
	end

	describe 'to_json' do
		let(:expected) { { cab: cab.registration_number, customer: customer.id, status: 'ongoing' }.to_json }
		
		before do
			subject.locate_cab(cabs: [cab])
		end
		
		it 'returns json' do
			expect(subject.to_json).to eq expected
		end
	end

end