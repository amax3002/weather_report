require 'bundler/setup'
require 'httparty'
require 'pry'


class Sun
WEATHER_API = 'ceaa7f96534634e7'
SUN_URI = "http://api.wunderground.com/api/#{WEATHER_API}/astronomy"

def get_sun(zipcode)
  HTTParty.get("#{SUN_URI}/q/#{zipcode}.json")
end

def get_sunrise_hour(zip)
  get_sun(zip)['moon_phase']['sunrise']['hour']
end

def get_sunrise_minute(zip)
  get_sun(zip)['moon_phase']['sunrise']['minute']
end

def get_full_sunrise_time(zip)
  return "The sunrise will be at: #{get_sunrise_hour(zip)}:#{get_sunrise_minute(zip)} AM"
end

end
