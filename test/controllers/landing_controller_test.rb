require "test_helper"

class LandingControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get landing_show_url
    assert_response :success
  end
end
