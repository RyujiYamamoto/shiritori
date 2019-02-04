require 'test_helper'

class ShiritoriMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should redirected to login-view when not logged_in" do
    get shiritori_messages_index_url
    assert_redirected_to login_url
  end
  
  #TODO modify to pass this test
　test "should get index" do
    @user = User.new(name: "test", email: "test@example.com", 
                     password: "foobar", password_confirmation: "foobar")
    session[:user_id] = @user.id
    get shiritori_messages_index_url
    assert_response :success
  end
end
