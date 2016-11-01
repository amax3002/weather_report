require 'bundler/setup'
require 'httparty'
require 'pry'

require './tenday'
require './sun'
require './weather'
require './alert'


puts "Please enter a zipcode: "
zipcode = gets.chomp().to_i


weather = Weather.new.get(zipcode)
tenday = Tenday.new.get10(zipcode)
sun = Sun.new.get_sun(zipcode)
alert = Alert.new.get_alert(zipcode)

puts ''
puts ''
puts '--'*40
puts '--'*40
puts "You have chosen #{Weather.new.get_full_name(weather)}"
puts '--'*40
puts "Current temperture in F: #{Weather.new.get_temp_in_f(weather)}"
puts "Humidity: #{Weather.new.get_humidity(weather)}"
puts "Wind mph: #{Weather.new.get_wind(weather)}"
puts '--'*40
puts "The 10 day forcast"
puts Tenday.new.get_all_periods(tenday)
puts '--'*40
puts "Sunrise and Sunset"
puts Sun.new.get_full_sunrise_time(sun)
puts Sun.new.get_full_sunset_time(sun)
puts '--'*40
puts "Alerts Status"
puts Alert.new.get_full_alert(alert)
puts '--'*40
puts '--'*40
