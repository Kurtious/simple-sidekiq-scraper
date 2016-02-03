require 'mongo'
class Tracking
	@client
	def initialize()
		@client = Mongo::Client.new('mongodb://127.0.0.1:27017/short_link_db')
	end

	def find()
		@client[:track].aggregate([{:$group => { :_id => "$longUrl", "total_clicks" => { :$sum => "$count"}}}]).each{|d| puts d}
	end

	def findBy(url)
		@client[:track].find({"longUrl" => /url/})
	end

	def getUrls
		@client[:track].find().map{|e| e["longUrl"]}
	end


end