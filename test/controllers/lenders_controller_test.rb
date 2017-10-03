require 'test_helper'

class LendersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get lenders_show_url
    assert_response :success
  end

end
