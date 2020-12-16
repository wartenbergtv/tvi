require "capybara_helper"

describe "Administrate Episodes", type: :system do
  it "overview page" do
    episode = FactoryBot.create :episode

    visit "/"
    click_on "Episoden Administration"
    expect(page).to have_selector "h1", text: "Episodes"

    expect(page).to have_table_with_exact_data([
                                                 ["Title",
                                                  "downloads_count",
                                                  "published_on",
                                                  "",
                                                  ""],
                                                 ["Soli Wartenberg",
                                                  "1",
                                                  episode.published_on.strftime("%d.%m.%Y"),
                                                  "Show", "Edit"]
                                               ])
  end

  it "create a new episode" do
    visit "/"
    click_on "Episoden Administration"

    click_on "Add"

    expect(page).to have_text "New Episode"

    click_on "Save"
    expect(page).to have_content "Title muss ausgefüllt werden"
    expect(page).to have_content "Description muss ausgefüllt werden"
    expect(page).to have_content "File url muss ausgefüllt werden"
    # expect(page).to have_content "Published at muss ausgefüllt werden"

    fill_in "Title", with: "Talk about shit"
    fill_in "Description", with: "more alk about shit"
    fill_in "File url", with: "https:\\blah.test\001-test.mp3"

    click_on "Save"
    expect(page).to have_content "Episode was successfully created."
    expect(page).to have_table_with_exact_data([
                                                 ["Title", "downloads_count", "published_on", "", ""],
                                                 ["Talk about shit", "0", "", "Show", "Edit"]
                                               ])
  end

  it "edits a existin episode" do
    episode = FactoryBot.create :episode

    visit "/"
    click_on "Episoden Administration"

    click_on "Edit"

    expect(page).to have_text "Editing Episode"

    fill_in "Title", with: "test"

    click_on "Save"

    expect(page).to have_content "Episode was successfully updated."
    expect(page).to have_table_with_exact_data([
                                                 ["Title", "downloads_count", "published_on", "", ""],
                                                 ["test", "1", episode.published_on.strftime("%d.%m.%Y"), "Show", "Edit"]
                                               ])
  end
end
