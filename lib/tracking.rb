require 'mongo'
class Tracking

	@client
	def initialize()
		@client = Mongo::Client.new('mongodb://127.0.0.1:27017/short_link_db')
	end
	
end