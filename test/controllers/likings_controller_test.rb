require 'test_helper'

class LikingsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get likings_create_url
    assert_response :success
  end

  test "should get destroy" do
    get likings_destroy_url
    assert_response :success
  end

end
