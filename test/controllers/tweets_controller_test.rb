require 'test_helper'

class TweetsControllerTest < ActionDispatch::IntegrationTest
  test "should get timeline" do
    get tweets_timeline_url
    assert_response :success
  end

end
