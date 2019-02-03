require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  #TODO modify to pass this test
  test "login with invalid information" do
    get login_path
    assert_response :success
    assert_template 'sessions/new'
    
    session[:email] = ""
    session[:password] = ""
    post login_path
    assert_template 'sessions/new'
    assert_select "div.alert"
  end
end
