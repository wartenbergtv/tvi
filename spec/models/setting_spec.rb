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
#  ituens_category             :string           not null
#  ituens_language             :string           not null
#  ituens_sub_category         :string           not null
#  itunes_url                  :string
#  language                    :string           not null
#  logo_url                    :string           not null
#  owner                       :string           not null
#  seo_keywords                :text
#  short_description           :text             not null
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
end
