require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_home_url
    assert_response :success
  end

  test "should get praise" do
    get static_praise_url
    assert_response :success
  end

  test "should get preface" do
    get static_preface_url
    assert_response :success
  end

  test "should get errata" do
    get static_errata_url
    assert_response :success
  end

  test "should get examples" do
    get static_examples_url
    assert_response :success
  end

  test "should get share" do
    get static_share_url
    assert_response :success
  end

end
