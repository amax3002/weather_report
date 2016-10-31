require 'bundler/setup'
require 'httparty'
require 'pry'

# http://api.wunderground.com/api/YOUR_API_KEY/conditions/q/THE_DESIRED_STATE/THE_DESIRED_CITY.json

#http://api.wunderground.com/api/ceaa7f96534634e7/conditions/q/20001.json

class Weather
  WEATHER_API = 'ceaa7f96534634e7'
  BASE_URI = "http://api.wunderground.com/api/#{WEATHER_API}"

  def get(zipcode)
    HTTParty.get("#{BASE_URI}/conditions/q/#{zipcode}.json")
  end

  def get_temp_in_f
    self.parsed_response['current_observation']['temp_f']
  end
end
