## How to run Scraper + Web Application ##

Steps:

Install gems
```
$ bundle install
```

Migrate database
```
$ rake db:migrate
```

Run redis ( I assume there one installed already on the machine)
```
$ redis-server
```

Run sidekiq
```
$ bundle exec sidekiq
```

Run Rails (for the sake of mock, lets stick with development enviroment )
```
$ rails s
```

## On any Browser (domain = localhost:3000) ##

```
GET / 
```
index of topsites: here you should see following features:
	tabular form 
	sort by column 
	record editing in modal through AJAX
	search
	drag and drop lists

```
GET /scrap_alexa
```
trigger point for SideKiq Worker to start scraping (rest-client) from Alexa, extract relevant information (nokogiri) and finally create records in database 
you may want to check:
lib/tasks/alexa_scrapper.rb
app/workers/alexa_worker.rb

```
GET /sidekiq
```
integrate view for monitoring sidekiq jobs
