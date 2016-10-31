require 'minitest/autorun'
require 'minitest/pride'
require './weather'
require './sun'
require 'webmock/minitest'

require 'active_support'
require 'active_support/core_ext'

class SunTest < Minitest::Test
  def test_class_exists
    assert Sun
  end

  def test_get_sunrise_hour
    stub_request(
      :get,
      "http://api.wunderground.com/api/ceaa7f96534634e7/astronomy/q/20001.json"
    ).to_return(
      :status => 200,
      :body => File.read("responses/washington_dc_sun_get.json"),
      :headers => {'Content-Type' => 'application/json'}
    )
    a = Sun.new.get_sun(20001)

    assert_equal  Sun.new.get_full_sunrise_time(a), "The sunrise will be at: 7:34 AM"
  end

  def test_get_sunset_hour
    stub_request(
      :get,
      "http://api.wunderground.com/api/ceaa7f96534634e7/astronomy/q/20001.json"
    ).to_return(
      :status => 200,
      :body => File.read("responses/washington_dc_sun_get.json"),
      :headers => {'Content-Type' => 'application/json'}
    )
    a = Sun.new.get_sun(20001)

    assert_equal  Sun.new.get_full_sunset_time(a), "The sunset will be at: 6:08 PM"
  end

end
