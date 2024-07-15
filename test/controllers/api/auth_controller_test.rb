require "test_helper"

class Api::AuthControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:user_one)
  end

  test "should sign up user" do
    assert_difference('User.count') do
      post api_auth_signup_url, params: { email: 'test@example.com', password: 'password123' }, as: :json
    end

    assert_response :created
    assert JSON.parse(response.body).key?('status'), "Response should contain 'status' key"
  end

  test "should not sign up user with invalid params" do
    assert_no_difference('User.count') do
      post api_auth_signup_url, params: { email: '', password: 'password123' }, as: :json
    end

    assert_response :unprocessable_entity
    assert JSON.parse(response.body).key?('errors'), "Response should contain 'errors' key"
  end

  test "should log in user with correct credentials" do
    post api_auth_login_url, params: { email: @user.email, password: 'password123' }, as: :json

    assert_response :ok
    assert JSON.parse(response.body).key?('token'), "Response should contain 'token' key"
  end

  test "should not log in user with incorrect password" do
    post api_auth_login_url, params: { email: @user.email, password: 'wrongpassword' }, as: :json

    assert_response :unauthorized
    assert JSON.parse(response.body).key?('error'), "Response should contain 'error' key"
  end

  test "should not log in non-existent user" do
    post api_auth_login_url, params: { email: 'nonexistent@example.com', password: 'password123' }, as: :json

    assert_response :unauthorized
    assert JSON.parse(response.body).key?('error'), "Response should contain 'error' key"
  end
end
