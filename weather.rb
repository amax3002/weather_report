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

  def get_temp_in_f(input)
    a = input
    a['current_observation']['temp_f']
  end

  def get_full_name(input)
    a = input
    a['current_observation']['display_location']['full']
  end

  def get_humidity(input)
    a = input
    a['current_observation']['relative_humidity']
  end

  def get_wind(input)
    a = input
    a['current_observation']['wind_gust_mph']
  end



end
