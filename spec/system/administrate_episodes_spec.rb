require "capybara_helper"

describe "Administrate Episodes", type: :system do
  it "overview page" do
    FactoryBot.create :episode

    visit "/"
    click_on "Episoden Administration"
    expect(page).to have_selector "h1", text: "Episodes"

    expect(page).to have_table_with_exact_data([
                                                 ["Title", "downloads_count", "published_at", "", ""],
                                                 ["test", "0", Time.current.strftime("%d.%m.%Y"), "Edit  Show"]
                                               ])
  end

  it "create a new episode" do
    visit "/"
    click_on "Episoden Administration"

    click_on "Add"

    expect(page).to have_text "New Episode"

    fill_in "Title", with: "asfasdf"

    click_on "Save"
    expect(page).to have_content "Station was successfully updated."
    expect(page).to have_table_with_exact_data([
                                                 ["Title", "downloads_count", "published_at", "", ""],
                                                 ["test", "0", Time.current.strftime("%d.%m.%Y"), "Edit  Show"]
                                               ])
  end

  it "edits a existin episode" do
    FactoryBot.create :episode
    visit "/"
    click_on "Episoden Administration"

    click_on "Edit"

    expect(page).to have_text "Edit Episode"

    fill_in "Title", with: "fm4"

    click_on "Save"

    expect(page).to have_content "Epsiode was successfully created."
    expect(page).to have_table_with_exact_data([
                                                 ["Title", "downloads_count", "published_at", "", ""],
                                                 ["test", "0", Time.current.strftime("%d.%m.%Y"), "Edit  Show"]
                                               ])
  end
end
