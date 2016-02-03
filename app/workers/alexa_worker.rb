require 'tasks/alexa_scrapper'
class AlexaWorker
	
	include Sidekiq::Worker

	def perform(task_name="ScrapAlexa", tries = 1)
		topsites = AlexaScrapper.new.parse
		puts topsites
		topsites.each do |site|
			record = TopSite.where(:name => site[:name])
			if record.count == 0
				TopSite.create(site)
			end
		end
	end
end