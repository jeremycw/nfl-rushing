require "application_system_test_case"

class RushesTest < ApplicationSystemTestCase
  setup do
    @rush = rushes(:one)
  end

  test "visiting the index" do
    visit rushes_url
    assert_selector "h1", text: "Rushes"
  end

  test "creating a Rush" do
    visit rushes_url
    click_on "New Rush"

    click_on "Create Rush"

    assert_text "Rush was successfully created"
    click_on "Back"
  end

  test "updating a Rush" do
    visit rushes_url
    click_on "Edit", match: :first

    click_on "Update Rush"

    assert_text "Rush was successfully updated"
    click_on "Back"
  end

  test "destroying a Rush" do
    visit rushes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rush was successfully destroyed"
  end
end
