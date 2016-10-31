require 'bundler/setup'
require 'httparty'
require 'pry'


class Alert
WEATHER_API = 'ceaa7f96534634e7'
ALERT_URI = "http://api.wunderground.com/api/#{WEATHER_API}/alerts"

def get_alert(zipcode)
  HTTParty.get("#{ALERT_URI}/q/#{zipcode}.json")
end


  def get_alert_type(zip)
    input = []
    input = get_alert(zip)['alerts'].collect { |k| k['type']  }
    input.join("")
  end

  def get_alert_description(zip)
    input = []
    input = get_alert(zip)['alerts'].collect { |k| k['description']  }
    input.join("")
  end

  def get_full_alert(zip)
    if get_alert_type(zip) == "" || get_alert_type(zip) == nil || get_alert_type(zip) == []
      return "No Alert"
    else
      return "The current alert is #{get_alert_type(zip)} with a local description of: #{get_alert_description(zip)}"
    end
  end
  
end
