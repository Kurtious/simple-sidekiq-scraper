module StatisticsHelper

	def browerName(ua)
		Browser.new(:ua => ua).name
	end

	def sanitize(lang)
		lang.split(",").first
	end
end
