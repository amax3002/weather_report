require 'bundler/setup'
require 'httparty'
require 'pry'


class Alert
  WEATHER_API = 'ceaa7f96534634e7'
  ALERT_URI = "http://api.wunderground.com/api/#{WEATHER_API}/alerts"

  def get_alert(zipcode)
    HTTParty.get("#{ALERT_URI}/q/#{zipcode}.json")
  end

  def get_alert_type(input)
    a = input
    input = []
    input = a['alerts'].collect { |k| k['type']  }
    input.join("")
  end

  def get_alert_description(input)
    a = input
    input = []
    input = a['alerts'].collect { |k| k['description']  }
    input.join("")
  end

  def get_full_alert(input)
    if get_alert_type(input) == "" || get_alert_type(input) == nil || get_alert_type(input) == []
      return "No Alert"
    else
      return "The current alert is #{get_alert_type(input)} with a local description of: #{get_alert_description(input)}"
    end
  end

end
