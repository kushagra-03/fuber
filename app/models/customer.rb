class Customer
	attr_reader :id, :latitude, :longitude


	def self.all
		@@all ||= [
			new(id: 1, latitude: 12345, longitude: 1133232),
			new(id: 2, latitude: 13344, longitude: 1133233),
			new(id: 3, latitude: 13341, longitude: 1133234),
		]
	end

	def self.find(id)
		@all.find { |customer| customer.id == id }
	end

	def initialize(id:, latitude:, longitude:)
		@id = id
		@latitude = latitude
		@longitude = longitude
	end

end