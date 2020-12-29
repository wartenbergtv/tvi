require "capybara_helper"

describe "Setting", type: :system do
  let!(:setting) { FactoryBot.create(:setting) }

  context "when logged in as admin" do
    let(:admin) { FactoryBot.create :user, :admin }

    before { login_as admin }

    it "edit page" do
      visit "/"
      click_on "Setting"
      expect(page).to have_selector "h1", text: "Edit Setting"
      save_and_open_page
      fill_in "Title", with: "Pod Blah"
      fill_in "Description", with: "more Talk about shit"
      fill_in "Short description", with: "snall talk about shit"
      fill_in "Seo keywords", with: "bayern, oberbayern "
      fill_in "Author", with: "Joe Doe, Mr. Tee"

      fill_in "Owner", with: "Joe Doe"
      fill_in "Email", with: "j.doe@test.de"
      fill_in "Ituens category", with: "Olds"
      fill_in "Ituens sub category", with: "jokes"
      fill_in "Logo ur", with: "https://test.de/pic.jpg"
      fill_in "Default episode artwork url", with: "https://test.de/art.jpg"
      fill_in "About episode number", with: 2
      todo
      fill_in "Facebook ulr", with: "asd"
      fill_in "Youtube ulr", with: "asd"
      fill_in "Twitter ulr", with: "asd"
      fill_in "Instagram ulr", with: "asd"
      fill_in "Itunes ulr", with: "asd"
      fill_in "Spotify ulr", with: "asd"
      fill_in "Google ulr", with: "asd"

      click_on "Save"

      expect(page).to have_content "Setting was successfully updated"
      setting = Setting.current.reload
      expect(setting.title).to eq "Talk about shit"
    end
  end

  context "when logged in  as user" do
    let(:user) { FactoryBot.create :user }

    before { login_as user }

    it "does not have Adminstration link" do
      visit "/"

      expect(page).not_to have_link "Setting"
    end

    it "gets  Access Denied for admin functions" do
      visit "/admin/setting/edit"
      expect(page).to have_content "Access Denied"
    end
  end

  context "when not logged in" do
    it "does not have setting link" do
      visit "/"

      expect(page).not_to have_link "setting"
    end

    it "gets  Access Denied for admin functions" do
      visit "/admin/setting/edit"
      expect(page).to have_content "Access Denied"
    end
  end
end
