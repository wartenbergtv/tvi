require "capybara_helper"

describe "Episodes", type: :system do
  let!(:setting) { FactoryBot.create(:setting) }

  context "overview page" do
    it "shows only active episodes" do
      FactoryBot.create :episode, title: "future Test", number: 5, published_on: 1.day.since
      FactoryBot.create :episode, title: "last Test", number: 4, published_on: Time.zone.today
      FactoryBot.create :episode, title: "inactive Test", number: 3, published_on: Time.zone.today, active: false
      FactoryBot.create :episode, title: "second Test", number: 2, published_on: 1.day.ago
      FactoryBot.create :episode, title: "first Test", number: 1, published_on: 2.weeks.ago

      visit "/episodes"

      expect(page).to have_selector "h1", text: "Alle Episoden"
      expect(page).to have_title "Alle Episoden"
      expect(page).to have_content "second Test"
      expect(page).to have_content "last Test"
      expect(page).to have_content "first Test"
      expect(page).not_to have_content "future Test"
      expect(page).not_to have_content "inactive Test"
    end
  end

  context "show page" do
    it "gets an epsiode by slug" do
      FactoryBot.create :episode, title: "Blah Test", number: 1

      visit "/episodes/001-blah-test"

      expect(page).to have_content "001"
      expect(page).to have_content "Blah Test"
      expect(page).to have_title "Blah Test"
      # meta tags
    end

    it "gets an inactive epsiode by slug" do
      FactoryBot.create :episode, title: "Blah Test", number: 1, active: false

      visit "/episodes/001-blah-test"

      expect(page).to have_content "001"
      expect(page).to have_content "Blah Test"
      expect(page).to have_title "Blah Test"
    end

    it "gets an future epsiode by slug" do
      FactoryBot.create :episode, title: "Blah Test", number: 1, published_on: 1.day.since

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
end
