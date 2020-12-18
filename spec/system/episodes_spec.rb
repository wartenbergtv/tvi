require "capybara_helper"

describe "Episodes", type: :system do
  it "overview page" do
    FactoryBot.create :episode

    visit "/"
    click_on "Archiv"

    expect(page).to have_selector "h1", text: "Episoden"
  end

  it "gets an epsiode by slug" do
    FactoryBot.create :episode, title: "Blah Test", slug: "001-blah-test"

    visit "/episodes/001-blah-test"

    expect(page).to have_selector "h1", text: "Blah Test"
  end

  it "gets an 404 by unknow slug" do
    visit "/episodes/001-blah-test"

    expect(page).to have_content "The page you were looking for doesn't exist"
  end
end
