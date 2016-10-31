require 'bundler/setup'
require 'httparty'
require 'pry'


class Tenday
  WEATHER_API = 'ceaa7f96534634e7'
  DAY10_URI = "http://api.wunderground.com/api/#{WEATHER_API}/forecast10day"

  def get10(zipcode)
    HTTParty.get("#{DAY10_URI}/q/#{zipcode}.json")
  end

  def get_all_periods(input)
    b = input
    array = []
    b['forecast']['txt_forecast']['forecastday'].each do |k|
      array <<  " - #{k['title']}: #{k['fcttext']}"

    end
    array.join("
")
  end

  def only_night_forcast(input)
    if input.downcase == "yes"
      return 2
    else
      return 1
    end
  end

  def get_all_periods_only_daytime(answer, input)
    a = input
    remander_by = only_night_forcast(answer)
    a['forecast']['txt_forecast']['forecastday'].each do |k|
      if (k['period'].to_i) == 0 || (k['period'].to_i % remander_by) == 0
        puts  "#{k['title']}: #{k['fcttext']}"
      end
    end
  end

end
