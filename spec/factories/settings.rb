# == Schema Information
#
# Table name: settings
#
#  id                          :bigint           not null, primary key
#  about_episode_number        :integer          not null
#  about_page                  :text             not null
#  author                      :string           not null
#  copyright                   :text             not null
#  default_episode_artwork_url :string           not null
#  description                 :text             not null
#  email                       :string           not null
#  facebook_url                :string
#  google_url                  :string
#  imprint_page                :text             not null
#  instagram_url               :string
#  ituens_category             :string           not null
#  ituens_sub_category         :string           not null
#  itunes_url                  :string
#  language                    :string           not null
#  logo_url                    :string           not null
#  owner                       :string           not null
#  privacy_page                :text             not null
#  seo_keyword                 :text             is an Array
#  short_description           :text             not null
#  spotify_url                 :string
#  title                       :string           not null
#  twitter_url                 :string
#  youtube_url                 :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#
FactoryBot.define do
  factory :setting do
    title { "MyString" }
  end
end
