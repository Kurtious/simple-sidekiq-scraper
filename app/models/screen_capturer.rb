require 'screencap'
class ScreenCapturer
	def self.capture(url)
		fetcher_object = Screencap::Fetcher.new(url)
		screenshot = fetcher_object.fetch(
		    output: 'app/assets/images/'+url+'.png',
		    width: 1024, 
		    height: 768, 
		    top: 0, left: 0, width: 100, height: 100 
	  	)
	end

end