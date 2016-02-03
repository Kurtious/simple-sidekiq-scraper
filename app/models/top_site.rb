class TopSite < ActiveRecord::Base
	

	def self.search(query)
    	# where(:title, query) -> This would return an exact match of the query
    	where("lower(name) like ?", "%#{query.downcase}%") 
  	end
end
