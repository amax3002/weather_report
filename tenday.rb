require 'bundler/setup'
require 'httparty'
require 'pry'


class Tenday
WEATHER_API = 'ceaa7f96534634e7'
DAY10_URI = "http://api.wunderground.com/api/#{WEATHER_API}/forecast10day"

def get10(zipcode)
  HTTParty.get("#{DAY10_URI}/q/#{zipcode}.json")
end

def get_all_periods(zip)
  get10(zip)['forecast']['txt_forecast']['forecastday'].collect { |k| k['period']  }
end

end
