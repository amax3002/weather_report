require 'minitest/autorun'
require 'minitest/pride'
require './weather'
require './alert'
require 'webmock/minitest'

require 'active_support'
require 'active_support/core_ext'

class AlertTest < Minitest::Test

  def test_class_exists
    assert Alert
  end

  #59261 zipcode has an alert going on as of 10/31/2016
  def test_full_alert_with_alert
    stub_request(
      :get,
      "http://api.wunderground.com/api/ceaa7f96534634e7/alerts/q/59261.json"
    ).to_return(
      :status => 200,
      :body => File.read("responses/saco_alert_get.json"),
      :headers => {'Content-Type' => 'application/json'}
    )

    assert_equal  Alert.new.get_full_alert(59261), "The current alert is WND with a local description of: Lake Wind Advisory"
  end

  def test_full_alert_without_alert
    stub_request(
      :get,
      "http://api.wunderground.com/api/ceaa7f96534634e7/alerts/q/20001.json"
    ).to_return(
      :status => 200,
      :body => File.read("responses/washington_dc_alert_get.json"),
      :headers => {'Content-Type' => 'application/json'}
    )

    assert_equal  Alert.new.get_full_alert(20001), "No Alert"
  end
end
