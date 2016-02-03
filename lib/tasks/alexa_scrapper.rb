require 'rubygems'
require 'rest-client'
require 'nokogiri'

class AlexaScrapper
	@pages = 1

	def initialize(range = 100)
		@pages = range / 25
		if (range % 25) != 0
			@pages += 1
		end	
	end

	def parse
		site_listings = []
		base_url = "http://www.alexa.com"
		topsites = "/topsites/global;"
		current_page = 0

		while(current_page < @pages)
			
			url = "#{base_url}#{topsites}#{current_page.to_s}"
			puts url
			body = RestClient.get url

			page = Nokogiri::HTML(body)

			page.css('li.site-listing').each do |listing|
				site_listings << {
					rank: listing.css('.count').text,
					name: listing.css('.desc-paragraph a').text,
					url: listing.css('.desc-paragraph a')[0]['href'] 
				}
			end

			current_page += 1
		end
		site_listings
	end
end