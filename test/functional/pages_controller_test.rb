require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get bohconf" do
    get :bohconf
    assert_response :success
  end

  test "should get ignite" do
    get :ignite
    assert_response :success
  end

  test "should get talk" do
    get :talk
    assert_response :success
  end

  test "should get stay" do
    get :stay
    assert_response :success
  end

  test "should get fivek" do
    get :fivek
    assert_response :success
  end

  test "should get happy" do
    get :happy
    assert_response :success
  end

  test "should get kids" do
    get :kids
    assert_response :success
  end

  test "should get sponsor" do
    get :sponsor
    assert_response :success
  end

  test "should get usergroups" do
    get :usergroups
    assert_response :success
  end

end
