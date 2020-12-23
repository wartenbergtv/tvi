require "capybara_helper"

describe "Episodes", type: :system do
  it "overview page" do
    episode = FactoryBot.create :episode

    visit "/"
    click_on "Archiv", match: :first

    expect(page).to have_selector "h2", text: "Archive"
    expect(page).to have_content episode.title
    expect(page).to have_content episode.description
  end

  it "gets an epsiode by slug" do
    FactoryBot.create :episode, title: "Blah Test", number: 1

    visit "/episodes/001-blah-test"

    expect(page).to have_content "001"
    expect(page).to have_content "Blah Test"
  end

  it "gets an 404 by unknow slug" do
    visit "/episodes/001-blah-test"

    expect(page).to have_content "The page you were looking for doesn't exist"
  end
end
