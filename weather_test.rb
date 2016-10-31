require 'minitest/autorun'
require 'minitest/pride'
require './weather'
require 'webmock/minitest'

require 'active_support'
require 'active_support/core_ext'

class WeatherTest < Minitest::Test
  def test_class_exists
    assert Weather
  end

  def test_can_get_weather
    stub_request(
      :get,
      "http://api.wunderground.com/api/ceaa7f96534634e7/conditions/q/20001.json"
    ).to_return(
      :status => 200,
      :body => File.read("responses/washington_dc_get.json"),
      :headers => {'Content-Type' => 'application/json'}
    )

    Weather.new.get(20001)
  end

  def test_can_get_temp_in_f
    stub_request(
      :get,
      "http://api.wunderground.com/api/ceaa7f96534634e7/conditions/q/20001.json"
    ).to_return(
      :status => 200,
      :body => File.read("responses/washington_dc_get.json"),
      :headers => {'Content-Type' => 'application/json'}
    )

  a =  Weather.new.get(20001)
  assert_equal a.parsed_response['current_observation']['temp_f'], 57.6
  #a.caller('pws')
  end
end
