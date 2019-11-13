class Booking
	attr_reader :customer, :cab, :status

	SEARCHING_STATUS = 'searching'
	ONGOING_STATUS = 'ongoing'
	ENDED_STATUS = 'ended'

	@@all ||= []

	def self.all
		@@all
	end

	def self.all=(bookings)
		@@all = bookings
	end

	def initialize(customer:)
		@customer = customer
		@cab = nil
		@status = SEARCHING_STATUS

		raise NilCustomerSupplied unless customer
	end

	def locate_cab(cabs: [], finder: NearestCabFinder, hipster: false)
		return nil if cabs.empty?

		cabs.select!(&:hipster?) if hipster

		if @cab = finder.new(location: customer.location, cabs: cabs).search
			@cab.occupy
			@@all << self
			@status = ONGOING_STATUS
			return @cab
		end
	end

	def end
		return false unless cab
		cab.unoccupy(customer.location)
		@status = ENDED_STATUS
		return true
	end

	def fulfilled?
		(!customer.nil? && !cab.nil?)
	end

	def to_json
		{ cab: cab.registration_number, customer: customer.id, status: status }.to_json
	end

	private

	def customer?
		customer.nil?
	end

	class NilCustomerSupplied < StandardError; end
end