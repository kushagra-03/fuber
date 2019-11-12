class Cab
	attr_reader :registration_number, :location

	def self.all
		@@all ||= [
			new(registration_number: 123, location: Location.new(latitude: 123345, longitude: 11233232)),
			new(registration_number: 124, location: Location.new(latitude: 123344, longitude: 11233233)),
			new(registration_number: 125, location: Location.new(latitude: 123341, longitude: 11233234)),
		]
	end

	def initialize registration_number:, location:
		@registration_number = registration_number
		@location = location
	end

end