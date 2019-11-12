class Location
	attr_reader :latitude, :longitude

	def initialize latitude:, longitude:
		@latitude = latitude
		@longitude = longitude
	end

	def distance_from other_location
		latitude_difference_squared = (other_location.latitude - self.latitude) ^ 2
		longitude_difference_squared = (other_location.longitude - self.longitude) ^ 2
		
		CMath.sqrt(latitude_difference_squared + longitude_difference_squared).round(4)
	end

end