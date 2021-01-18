require "capybara_helper"

describe "welcome", type: :system do
  let!(:setting) { FactoryBot.create(:setting) }

  context "when not logged in" do
    it "shows some basic informations" do
      visit "/"

      expect(page).to have_link "Wartenberger Podcast"
      expect(page).to have_title "Wartenberger Podcast"
      expect(page).to have_content setting.description
    end

    it "shows the title" do
      visit "/"

      expect(page).to have_content "Wartenberger Podcast"
      expect(page).to have_title "Wartenberger Podcast"
    end

    it "shows the about page" do
      visit "/"
      click_link "Über uns"

      expect(page).to have_content "Über Uns"
      expect(page).to have_title "Über den Podcast"
    end

    it "shows the impressum page" do
      visit "/"
      click_link "Impressum"

      expect(page).to have_selector "h1", text: "Impressum"
      expect(page).to have_title "Impressum"
    end

    it "shows the privacy page" do
      visit "/"

      click_link "Datenschutz"

      expect(page).to have_selector "h1", text: "Datenschutz"
      expect(page).to have_title "Datenschutz"
    end

    it "dont shows special links when you are not an admin" do
      visit "/"

      expect(page).not_to have_link "Administration"
      expect(page).not_to have_link "Account"
      expect(page).not_to have_link "Setting"
      expect(page).not_to have_link "Logout"
    end

    it "visit not existing bot url" do
      visit "/wp-login.php"

      expect(page).to have_content "Forbidden"
    end
  end

  context "when logged in as user" do
    let(:user) { FactoryBot.create :user }

    before { login_as user }

    it "shows special links when you are an admin" do
      visit "/"

      expect(page).not_to have_link "Administration"
      expect(page).not_to have_link "Setting"

      expect(page).to have_link "Account"
      expect(page).to have_link "Logout"
    end
  end

  context "when logged in as admin" do
    let(:admin) { FactoryBot.create :user, :admin }

    before { login_as admin }

    it "shows special links when you are an admin" do
      visit "/"

      expect(page).to have_link "Administration"
      expect(page).to have_link "Account"
      expect(page).to have_link "Account"
      expect(page).to have_link "Logout"
    end
  end
end
