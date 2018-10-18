require 'test_helper'

class ChatboxesControllerTest < ActionDispatch::IntegrationTest
  test "should get chatbox" do
    get chatboxes_chatbox_url
    assert_response :success
  end

end
