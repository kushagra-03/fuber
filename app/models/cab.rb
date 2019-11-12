class Cab
	attr_reader :registration_number, :latitude, :longitude

	def initialize(registration_number:, latitude:, longitude:)
		@registration_number = registration_number
		@latitude = latitude
		@longitude = longitude
	end

end