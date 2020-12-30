require "rails_helper"

RSpec.describe EpisodeCreator do
  let(:episode_attribs) { FactoryBot.attributes_for(:episode).except(:slug, :downloads_count) }

  it "creates an uniq slug" do
    creator = described_class.new episode_attribs.except(:number).merge title: "Anton Müller Wirt vom Reiter"

    episode = creator.call

    expect(episode).to be_truthy
    expect(episode.number).to eq 1
    expect(episode.slug).to eq "001-anton-muller-wirt-vom-reiter"
  end

  it "creates an uniq slug for already existing episodes" do
    list = FactoryBot.create_list(:episode, 5)

    creator = described_class.new episode_attribs.except(:number).merge title: "test mit §$1"
    episode = creator.call

    expect(episode).to be_truthy
    last_number = list.last.number + 1
    expect(episode.number).to eq last_number
    expect(episode.slug).to eq "0#{last_number}-test-mit-1"
  end

  context "when validations" do
    it "error when number is not uniq" do
      FactoryBot.create :episode, number: 1
      creator = described_class.new episode_attribs.merge number: 1

      expect do
        creator.call
      end.not_to change(Episode, :count)

      expect(creator.errors.count).to eq 1
      expect(creator.errors.full_messages.join).to eq "Number has already been taken"
    end

    it "error when file_url is not a url" do
      creator = described_class.new episode_attribs.merge file_url: "xx"

      expect do
        creator.call
      end.not_to change(Episode, :count)

      expect(creator.errors.count).to eq 1
      expect(creator.errors.full_messages.join).to eq "File url is not a valid URL"
    end

    it "error when artwork_url is not a url" do
      creator = described_class.new episode_attribs.merge artwork_url: 1

      expect do
        creator.call
      end.not_to change(Episode, :count)

      expect(creator.errors.count).to eq 1
      expect(creator.errors.full_messages.join).to eq "Artwork url is not a valid URL"
    end

    it "error when file_url is not uniq" do
      FactoryBot.create :episode, file_url: "https://test.com/001-blah"
      creator = described_class.new episode_attribs.merge file_url: "https://test.com/001-blah"

      expect do
        creator.call
      end.not_to change(Episode, :count)

      expect(creator.errors.count).to eq 1
      expect(creator.errors.full_messages.join).to eq "File url has already been taken"
    end
  end
end
