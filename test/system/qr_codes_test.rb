require "application_system_test_case"

class QrCodesTest < ApplicationSystemTestCase
  setup do
    @qr_code = qr_codes(:one)
  end

  test "visiting the index" do
    visit qr_codes_url
    assert_selector "h1", text: "Qr codes"
  end

  test "should create qr code" do
    visit qr_codes_url
    click_on "New qr code"

    fill_in "Url", with: @qr_code.url
    click_on "Create Qr code"

    assert_text "Qr code was successfully created"
    click_on "Back"
  end

  test "should update Qr code" do
    visit qr_code_url(@qr_code)
    click_on "Edit this qr code", match: :first

    fill_in "Url", with: @qr_code.url
    click_on "Update Qr code"

    assert_text "Qr code was successfully updated"
    click_on "Back"
  end

  test "should destroy Qr code" do
    visit qr_code_url(@qr_code)
    click_on "Destroy this qr code", match: :first

    assert_text "Qr code was successfully destroyed"
  end
end
