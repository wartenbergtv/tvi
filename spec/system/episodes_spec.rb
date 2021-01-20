require "capybara_helper"

describe "Episodes", type: :system do
  let!(:setting) { FactoryBot.create(:setting) }

  it "overview page" do
    episode = FactoryBot.create :episode

    visit "/"
    click_on "Episoden", match: :first

    expect(page).to have_selector "h2", text: "Episoden"
    expect(page).to have_content episode.title
    expect(page).to have_title "Episoden"
    expect(page).to have_content episode.description
  end

  it "gets an epsiode by slug" do
    FactoryBot.create :episode, title: "Blah Test", number: 1

    visit "/episodes/001-blah-test"

    expect(page).to have_content "001"
    expect(page).to have_content "Blah Test"
    expect(page).to have_title "Blah Test"
  end

  it "gets an 404 by unknow slug" do
    visit "/episodes/001-blah-test"

    expect(page).to have_content "The page you were looking for doesn't exist"
  end
end
