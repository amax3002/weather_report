require 'minitest/autorun'
require 'minitest/pride'
require './weather'
require './tenday'
require 'webmock/minitest'

require 'active_support'
require 'active_support/core_ext'

class TendayTest < Minitest::Test

  def test_class_exists
    assert Tenday
  end

  def test_get_all_periods_from_10_day_forcast_no_if_option
    stub_request(
      :get,
      "http://api.wunderground.com/api/ceaa7f96534634e7/forecast10day/q/20001.json"
    ).to_return(
      :status => 200,
      :body => File.read("responses/washington_dc_day_ten_get.json"),
      :headers => {'Content-Type' => 'application/json'}
    )

    a = Tenday.new.get10(20001)
    #190 is the sum of the numbers from 0 to 19
    assert_equal  Tenday.new.get_all_periods(a).count, 19
  end

  def test_get_all_periods_from_10_day_forcast
    skip
    stub_request(
      :get,
      "http://api.wunderground.com/api/ceaa7f96534634e7/forecast10day/q/20001.json"
    ).to_return(
      :status => 200,
      :body => File.read("responses/washington_dc_day_ten_get.json"),
      :headers => {'Content-Type' => 'application/json'}
    )

    a = Tenday.new.get10(20001)
    #190 is the sum of the numbers from 0 to 19
    assert_equal  Tenday.new.get_all_periods_only_daytime("no", a), 190
  end

end
