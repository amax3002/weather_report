require 'bundler/setup'
require 'httparty'
require 'pry'


class Sun
WEATHER_API = 'ceaa7f96534634e7'
SUN_URI = "http://api.wunderground.com/api/#{WEATHER_API}/astronomy"

def get_sun(zipcode)
  HTTParty.get("#{SUN_URI}/q/#{zipcode}.json")
end

def get_sunrise_hour(input)
  a = input
  a['moon_phase']['sunrise']['hour']
end

def get_sunrise_minute(input)
  a = input
  a['moon_phase']['sunrise']['minute']
end

def get_full_sunrise_time(input)
  return "The sunrise will be at: #{get_sunrise_hour(input)}:#{get_sunrise_minute(input)} AM"
end


def get_sunset_hour(input)
  a = input
  a['moon_phase']['sunset']['hour'].to_i - 12
end

def get_sunset_minute(input)
  a = input
  a['moon_phase']['sunset']['minute']
end

def get_full_sunset_time(input)
  return "The sunset will be at: #{get_sunset_hour(input)}:#{get_sunset_minute(input)} PM"
end

end
