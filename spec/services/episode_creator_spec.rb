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
    FactoryBot.create_list(:episode, 5)
    creator = described_class.new episode_attribs.except(:number).merge title: "test mit §$1"
    episode = creator.call

    expect(episode).to be_truthy
    expect(episode.number).to eq 6
    expect(episode.slug).to eq "006-test-mit-1"
  end
end
