require "capybara_helper"

describe "Episodes", type: :system do
  it "overview page" do
    episode = FactoryBot.create :episode

    visit "/"
    click_on "Episoden"
    expect(page).to have_selector "h1", text: "Episoden"
  end
end
