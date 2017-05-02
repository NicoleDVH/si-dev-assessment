require 'test_helper'

class SmssesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @smss = smsses(:one)
  end

  test "should get index" do
    get smsses_url
    assert_response :success
  end

  test "should get new" do
    get new_smss_url
    assert_response :success
  end

  test "should create smss" do
    assert_difference('Smss.count') do
      post smsses_url, params: { smss: { number: @smss.number, text: @smss.text } }
    end

    assert_redirected_to smss_url(Smss.last)
  end

  test "should show smss" do
    get smss_url(@smss)
    assert_response :success
  end

  test "should get edit" do
    get edit_smss_url(@smss)
    assert_response :success
  end

  test "should update smss" do
    patch smss_url(@smss), params: { smss: { number: @smss.number, text: @smss.text } }
    assert_redirected_to smss_url(@smss)
  end

  test "should destroy smss" do
    assert_difference('Smss.count', -1) do
      delete smss_url(@smss)
    end

    assert_redirected_to smsses_url
  end
end
