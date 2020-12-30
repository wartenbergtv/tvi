# == Schema Information
#
# Table name: settings
#
#  id                          :bigint           not null, primary key
#  about_episode_number        :integer          not null
#  author                      :string           not null
#  default_episode_artwork_url :string           not null
#  description                 :text             not null
#  email                       :string           not null
#  facebook_url                :string
#  google_url                  :string
#  instagram_url               :string
#  itunes_category             :string           not null
#  itunes_language             :string           not null
#  itunes_sub_category         :string           not null
#  itunes_url                  :string
#  language                    :string           not null
#  logo_url                    :string           not null
#  owner                       :string           not null
#  seo_keywords                :text
#  spotify_url                 :string
#  title                       :string           not null
#  twitter_url                 :string
#  youtube_url                 :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#
require "rails_helper"

RSpec.describe Setting, type: :model do
  it "has a valid factory" do
    setting = FactoryBot.build :setting

    expect(setting).to be_valid
    assert setting.save!
  end

  it "validates for a valid logo_url" do
    setting = FactoryBot.build :setting, logo_url: "blah"

    expect(setting).to be_invalid
    expect(setting.errors.full_messages.join).to eq "Logo url is not a valid URL"
  end

  it "validates for a valid default_episode_artwork_url" do
    setting = FactoryBot.build :setting, default_episode_artwork_url: "blah"

    expect(setting).to be_invalid
    expect(setting.errors.full_messages.join).to eq "Default episode artwork url is not a valid URL"
  end
end
