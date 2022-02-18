require 'test_helper'

class PetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pet = pets(:one)
  end

  test "should get index" do
    get pets_url
    assert_response :success
  end

  test "should get new" do
    get new_pet_url
    assert_response :success
  end

  test "should create pet" do
    assert_difference('Pet.count') do
      post pets_url, params: { pet: { age: @pet.age, breed: @pet.breed, can_be_petted: @pet.can_be_petted, can_walk_offleash: @pet.can_walk_offleash, can_walk_with_other_dogs: @pet.can_walk_with_other_dogs, desexed: @pet.desexed, image: @pet.image, is_male: @pet.is_male, name: @pet.name, size: @pet.size, user_id: @pet.user_id } }
    end

    assert_redirected_to pet_url(Pet.last)
  end

  test "should show pet" do
    get pet_url(@pet)
    assert_response :success
  end

  test "should get edit" do
    get edit_pet_url(@pet)
    assert_response :success
  end

  test "should update pet" do
    patch pet_url(@pet), params: { pet: { age: @pet.age, breed: @pet.breed, can_be_petted: @pet.can_be_petted, can_walk_offleash: @pet.can_walk_offleash, can_walk_with_other_dogs: @pet.can_walk_with_other_dogs, desexed: @pet.desexed, image: @pet.image, is_male: @pet.is_male, name: @pet.name, size: @pet.size, user_id: @pet.user_id } }
    assert_redirected_to pet_url(@pet)
  end

  test "should destroy pet" do
    assert_difference('Pet.count', -1) do
      delete pet_url(@pet)
    end

    assert_redirected_to pets_url
  end
end
