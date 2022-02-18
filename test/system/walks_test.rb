require "application_system_test_case"

class WalksTest < ApplicationSystemTestCase
  setup do
    @walk = walks(:one)
  end

  test "visiting the index" do
    visit walks_url
    assert_selector "h1", text: "Walks"
  end

  test "creating a Walk" do
    visit walks_url
    click_on "New Walk"

    fill_in "Cost", with: @walk.cost
    fill_in "Duration", with: @walk.duration
    fill_in "Geocode lat", with: @walk.geocode_lat
    fill_in "Geocode lng", with: @walk.geocode_lng
    fill_in "Pet", with: @walk.pet_id
    fill_in "Special instruction", with: @walk.special_instruction
    fill_in "Status", with: @walk.status
    fill_in "User", with: @walk.user_id
    click_on "Create Walk"

    assert_text "Walk was successfully created"
    click_on "Back"
  end

  test "updating a Walk" do
    visit walks_url
    click_on "Edit", match: :first

    fill_in "Cost", with: @walk.cost
    fill_in "Duration", with: @walk.duration
    fill_in "Geocode lat", with: @walk.geocode_lat
    fill_in "Geocode lng", with: @walk.geocode_lng
    fill_in "Pet", with: @walk.pet_id
    fill_in "Special instruction", with: @walk.special_instruction
    fill_in "Status", with: @walk.status
    fill_in "User", with: @walk.user_id
    click_on "Update Walk"

    assert_text "Walk was successfully updated"
    click_on "Back"
  end

  test "destroying a Walk" do
    visit walks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Walk was successfully destroyed"
  end
end
