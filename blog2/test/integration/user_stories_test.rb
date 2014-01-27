require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest

  test "should login user and redirect" do
    get login_path

    assert_response :success
    assert_template 'new'

    post session_path, :email => 'eugene@example.com', :password => 'secret'

    assert_response :redirect
    assert_redirected_to root_path

    follow_redirect!

    assert_response :success
    assert_template 'index'
    assert session[:user_id]
  end

  test "should logout user and redirect" do
    get logout_path

    assert_response :redirect
    assert_redirected_to root_path
    assert_nil session[:user]

    follow_redirect!

    assert_template 'index'
  end
end
