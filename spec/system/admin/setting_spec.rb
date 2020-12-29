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

      fill_in "Title", with: "Talk about shit"
      fill_in "Description", with: "more alk about shit"
      fill_in "Language", with: "de"

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
