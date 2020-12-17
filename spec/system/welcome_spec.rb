require "capybara_helper"

describe "welcome", type: :system do
  context "when not logged in" do
    it "shows the tranding tracks of this year" do
      visit "/"

      expect(page).to have_content("Welcome")
    end

    it "shows the about page" do
      visit "/"
      click_link "Über uns"

      expect(page).to have_selector "h1", text: "Über Uns"
    end

    it "shows the impressum page" do
      visit "/"
      click_link "Impressum"

      expect(page).to have_selector "h1", text: "Impressum"
    end

    it "shows the privacy page" do
      visit "/"

      click_link "Datenschutz"

      expect(page).to have_selector "h1", text: "Datenschutz"
    end

    it "dont shows special links when you are not an admin" do
      visit "/"

      expect(page).to have_link "Login"

      expect(page).not_to have_link "Administration"
      expect(page).not_to have_link "Account"
      expect(page).not_to have_link "Setting"
      expect(page).not_to have_link "Logout"
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
