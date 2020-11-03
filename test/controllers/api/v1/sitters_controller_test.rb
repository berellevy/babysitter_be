require 'test_helper'

class Api::V1::SittersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_sitters_index_url
    assert_response :success
  end

end
