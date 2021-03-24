require "capybara_helper"

describe "Status", type: :system do
  let!(:setting) { FactoryBot.create(:setting) }

  context "when logged in as admin" do
    let(:admin) { FactoryBot.create :user, :admin }

    before { login_as admin }

    it "show status" do
      visit "/"
      click_on "Status"
      expect(page).to have_selector "h1", text: "Status"
    end
  end

  context "when logged in as user" do
    let(:user) { FactoryBot.create :user }

    before { login_as user }

    it "does not have Adminstration link" do
      visit "/"

      expect(page).not_to have_link "Status"
    end

    it "gets Access Denied for admin functions" do
      visit "/status"
      expect(page).to have_content "Access Denied"
    end
  end

  context "when not logged in" do
    it "does not have the link" do
      visit "/"

      expect(page).not_to have_link "Status"
    end

    it "gets Access Denied for admin functions" do
      visit "/status"
      expect(page).to have_content "Access Denied"
    end
  end
end
