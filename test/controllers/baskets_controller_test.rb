require 'test_helper'

class BasketsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get baskets_create_url
    assert_response :success
  end

end
