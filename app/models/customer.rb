class Customer
	attr_reader :id, :location


	def self.all
		@@all ||= [
			new(id: 1, location: Location.new(latitude: 12345, longitude: 1133232)),
			new(id: 2, location: Location.new(latitude: 13344, longitude: 1133233)),
			new(id: 3, location: Location.new(latitude: 13341, longitude: 1133234)),
		]
	end

	def self.find(id)
		@all.find { |customer| customer.id == id }
	end

	def initialize(id:, location:)
		@id = id
		@location = location
	end

end