require './config/boot'
require './config/environment'
require 'httparty'


url = "https://d1rm3nbxa795it.cloudfront.net/crowdbar.json"
# Make sure we get don't get a bad URI
url = URI.parse(URI.encode(url.strip))
response = HTTParty.get(url)
cb_json  = JSON.parse(response.body)
puts cb_json
# cb_json = JSON.parse(File.read('public/crowdbar.json'))
