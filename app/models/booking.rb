class Booking
	attr_reader :customer, :cab

	def initialize(customer:, cab:)
		@customer = customer
		@cab = cab
	end
end