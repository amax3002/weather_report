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

    refute_equal Weather.new.get(20001), nil
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

  assert_equal Weather.new.get_temp_in_f(20001), 57.6
  end
end
