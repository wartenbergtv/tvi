require "capybara_helper"

describe "welcome", type: :system do
  it "shows the tranding tracks of this year" do
    visit "/"

    expect(page).to have_content("Welcome")
  end

  it "shows the about page" do
    visit "/"
    click_link "Über uns"

    expect(page).to have_selector "h1", text: "Über Uns"
  end

  it "shows the impressum page" do
    visit "/"
    click_link "Impressum"

    expect(page).to have_selector "h1", text: "Impressum"
  end

  it "shows the privacy page" do
    visit "/"

    click_link "Datenschutz"

    expect(page).to have_selector "h1", text: "Datenschutz"
  end
end
