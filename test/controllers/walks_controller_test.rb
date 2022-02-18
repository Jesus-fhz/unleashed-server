require 'test_helper'

class WalksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @walk = walks(:one)
  end

  test "should get index" do
    get walks_url
    assert_response :success
  end

  test "should get new" do
    get new_walk_url
    assert_response :success
  end

  test "should create walk" do
    assert_difference('Walk.count') do
      post walks_url, params: { walk: { cost: @walk.cost, duration: @walk.duration, geocode_lat: @walk.geocode_lat, geocode_lng: @walk.geocode_lng, pet_id: @walk.pet_id, special_instruction: @walk.special_instruction, status: @walk.status, user_id: @walk.user_id } }
    end

    assert_redirected_to walk_url(Walk.last)
  end

  test "should show walk" do
    get walk_url(@walk)
    assert_response :success
  end

  test "should get edit" do
    get edit_walk_url(@walk)
    assert_response :success
  end

  test "should update walk" do
    patch walk_url(@walk), params: { walk: { cost: @walk.cost, duration: @walk.duration, geocode_lat: @walk.geocode_lat, geocode_lng: @walk.geocode_lng, pet_id: @walk.pet_id, special_instruction: @walk.special_instruction, status: @walk.status, user_id: @walk.user_id } }
    assert_redirected_to walk_url(@walk)
  end

  test "should destroy walk" do
    assert_difference('Walk.count', -1) do
      delete walk_url(@walk)
    end

    assert_redirected_to walks_url
  end
end
