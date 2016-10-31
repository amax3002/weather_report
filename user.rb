require 'bundler/setup'
require 'httparty'
require 'pry'

require './tenday'
require './sun'
require './weather'
require './alert'


puts "Please enter a zipcode: "
user_input = gets.chomp().to_i
puts ''
puts "For the 10 day forcast, would you want to exclude nightime temperture? (yes/no)"
user_answer = gets.chomp().to_i

weather = Weather.new.get(user_input)
tenday = Tenday.new.get10(user_input)
sun = Sun.new.get_sun(user_input)
alert = Alert.new.get_alert(user_input)


puts ''
puts "You have chosen #{Weather.new.get_full_name(weather)}"
puts '--'*40
puts "Current temperture in F: #{Weather.new.get_temp_in_f(weather)}"
puts "Humidity: #{Weather.new.get_humidity(weather)}"
puts "Wind mph: #{Weather.new.get_wind(weather)}"
puts '--'*40
puts "The 10 day forcast is:"
puts Tenday.new.get_all_periods_only_daytime(user_answer, tenday)
puts '--'*40
puts "Sunrise and Sunset"
puts Sun.new.get_full_sunrise_time(sun)
puts Sun.new.get_full_sunset_time(sun)
puts '--'*40
puts "Alerts Status"
puts Alert.new.get_full_alert(alert)
