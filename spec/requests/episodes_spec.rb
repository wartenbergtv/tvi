require "rails_helper"

RSpec.describe "episodes", type: :request do
  describe "GET /episodes.rss" do
    xit "generates a feed" do
      FactoryBot.create_list :episode, 2

      get "/episodes.rss"

      expect(response.body).to eq "asdf"
    end
  end

  describe "GET /episode.mp3" do
    it "increment the download counter" do
      episode = EpisodePresenter.new FactoryBot.create :episode, downloads_count: 0, number: 4, title: :test

      get episode.mp3_url

      expect(response.body).to eq "<html><body>You are being " \
      "<a href=\"https://wartenberger-podcast.s3.eu-central-1.amazonaws.com/004-test.mp3\">redirected</a>.</body></html>"
      expect(episode.reload.downloads_count).to eq 1
    end
  end
end
