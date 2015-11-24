require "spec_helper"

feature "user add contact name" do
  scenario "successfully add contact name" do
    visit "/contacts"
    fill_in "Name", with: "Christina"
    click_button "Submit"

    expect(page).to have_content "Christina"
  end

  scenario "submit form without name" do
    visit "/contacts"
    click_button "Submit"

    expect(page).to_not have_css("li")
  end
end
