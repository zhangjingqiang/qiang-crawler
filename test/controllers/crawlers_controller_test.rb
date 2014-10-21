require 'test_helper'

class CrawlersControllerTest < ActionController::TestCase
  test "should get google" do
    get :google
    assert_response :success
  end

  test "should get facebook" do
    get :facebook
    assert_response :success
  end

  test "should get twitter" do
    get :twitter
    assert_response :success
  end

end
