require "application_system_test_case"

class RidersTest < ApplicationSystemTestCase
  setup do
    @rider = riders(:one)
  end

  test "visiting the index" do
    visit riders_url
    assert_selector "h1", text: "Riders"
  end

  test "should create rider" do
    visit riders_url
    click_on "New rider"

    fill_in "Address", with: @rider.address
    fill_in "Name", with: @rider.name
    fill_in "Telephone", with: @rider.telephone
    fill_in "User", with: @rider.user_id
    click_on "Create Rider"

    assert_text "Rider was successfully created"
    click_on "Back"
  end

  test "should update Rider" do
    visit rider_url(@rider)
    click_on "Edit this rider", match: :first

    fill_in "Address", with: @rider.address
    fill_in "Name", with: @rider.name
    fill_in "Telephone", with: @rider.telephone
    fill_in "User", with: @rider.user_id
    click_on "Update Rider"

    assert_text "Rider was successfully updated"
    click_on "Back"
  end

  test "should destroy Rider" do
    visit rider_url(@rider)
    click_on "Destroy this rider", match: :first

    assert_text "Rider was successfully destroyed"
  end
end
