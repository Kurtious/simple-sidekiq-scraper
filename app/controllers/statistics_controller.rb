class StatisticsController < ApplicationController
	
	def get_urls 
		@data = Mongo::Client.new('mongodb://127.0.0.1:27017/short_link_db')[:track].find()
	end

	def get_tracking_for_url
		@data = Mongo::Client.new('mongodb://127.0.0.1:27017/short_link_db')[:track].find({"longUrl" => params[:url]}).map{|e| e}
	end
end
