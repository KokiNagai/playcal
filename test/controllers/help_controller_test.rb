require 'test_helper'

class HelpControllerTest < ActionDispatch::IntegrationTest
  test "should get playcal-post" do
    get help_playcal-post_url
    assert_response :success
  end

end
