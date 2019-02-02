require 'test_helper'

class ShiritoriMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shiritori_messages_index_url
    assert_response :success
  end

end
