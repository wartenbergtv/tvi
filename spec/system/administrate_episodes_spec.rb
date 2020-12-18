require "capybara_helper"

describe "Administrate Episodes", type: :system do
  context "when logged in as admin" do
    let(:admin) { FactoryBot.create :user, :admin }

    before { login_as admin }

    it "overview page" do
      episode = FactoryBot.create :episode, title: "Soli Wartenberg"

      visit "/"
      click_on "Administration"
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
      click_on "Administration"

      click_on "Add"

      expect(page).to have_text "New Episode"

      click_on "Save"
      expect(page).to have_content "Title can't be blank"
      expect(page).to have_content "Description can't be blank"
      expect(page).to have_content "File url can't be blank"
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
      click_on "Administration"

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

  context "when logged in  as user" do
    let(:user) { FactoryBot.create :user }

    before { login_as user }

    it "does not have Adminstration link" do
      visit "/"

      expect(page).not_to have_link "Administration"
    end

    it "gets  Access Denied for admin functions" do
      visit "/admin/episodes"
      expect(page).to have_content "Access Denied"
    end
  end

  context "when not logged in" do
    it "does not have Adminstration link" do
      visit "/"

      expect(page).not_to have_link "Administration"
    end

    it "gets  Access Denied for admin functions" do
      visit "/admin/episodes"
      expect(page).to have_content "Access Denied"
    end
  end
end
