class Cab
	attr_reader :registration_number, :latitude, :longitude

	def self.all
		@@all ||= [
			new(registration_number: 123, latitude: 123345, longitude: 11233232),
			new(registration_number: 124, latitude: 123344, longitude: 11233233),
			new(registration_number: 125, latitude: 123341, longitude: 11233234),
		]
	end

	def initialize(registration_number:, latitude:, longitude:)
		@registration_number = registration_number
		@latitude = latitude
		@longitude = longitude
	end

end