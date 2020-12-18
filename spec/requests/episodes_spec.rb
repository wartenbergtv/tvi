require "rails_helper"

RSpec.describe "episodes", type: :request do
  describe "GET /episodes.xml" do
    it "generates a feed" do
      FactoryBot.create_list :episode, 2

      get "/episodes.xml"

      expect(response.body).to eq "asdf"
    end
  end
end
