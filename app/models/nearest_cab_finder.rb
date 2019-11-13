class NearestCabFinder
	attr_reader :location, :cabs

	def initialize(location:, cabs: [])
		@location = location
		@cabs = cabs
	end

	def search
		@distance_map ||= cabs.each_with_object({}) do |cab, distance_map|
			distance_map[cab.registration_number] = cab.distance_from(location)
		end

		minimum_distance = @distance_map.values.min
		nearest_cab_registration_number = @distance_map.key(minimum_distance)
		cabs.find { |cab| cab.registration_number == nearest_cab_registration_number }
	end

end