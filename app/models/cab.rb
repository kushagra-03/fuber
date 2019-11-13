class Cab
	attr_reader :registration_number, :occupied
	attr_accessor :location

	def self.all
		@@all ||= [
			new(registration_number: 123, location: Location.new(latitude: 14, longitude: 120)),
			new(registration_number: 124, location: Location.new(latitude: 16, longitude: 100)),
			new(registration_number: 125, location: Location.new(latitude: 17, longitude: 120)),
			PinkCab.new(registration_number: 126, location: Location.new(latitude: 17, longitude: 120))
		]
	end

	def self.available
		all.select { |cab| cab.occupied == false }
	end

	def self.all=(cabs)
		@@all = cabs
	end

	def self.hipster
		all.select(&:hipster?)
	end

	def initialize registration_number:, location:
		@registration_number = registration_number
		@location = location
		@occupied = false
	end

	def occupy
		@occupied = true
	end

	def unoccupy(location)
		self.location = location
		@occupied = false
	end

	def distance_from locatable
		location.distance_from locatable
	end

	def hipster?
		false
	end
end