require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.new(name: "test", email: "test@example.com", 
                     password: "foobar", password_confirmation: "foobar")
    @user_created = User.create(name: "created", email: "created@example.com", 
                     password: "foobar", password_confirmation: "foobar")
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: @user.email, name: @user.name, password: @user.password, 
                                password_confirmation: @user.password_confirmation} }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user_created)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user_created)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user_created), params: { user: { email: @user.email, name: @user.name, password: @user.password, 
                                password_confirmation: @user.password_confirmation} }
    assert_redirected_to user_url(@user_created)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user_created)
    end

    assert_redirected_to users_url
  end
end
