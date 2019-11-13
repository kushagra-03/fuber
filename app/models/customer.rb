class Customer
	attr_reader :id, :location

	def self.all
		@@all ||= [
			new(id: '1', location: Location.new(latitude: 23, longitude: 113)),
		]
	end

	def self.find(id)
		all.find { |customer| customer.id == id }
	end

	def initialize(id:, location:)
		@id = id
		@location = location
	end
end