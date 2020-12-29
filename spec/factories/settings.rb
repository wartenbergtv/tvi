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
FactoryBot.define do
  factory :setting do
    title { "Wartenberger Podcast" }

    short_description { "Der Podcast über und um den Markt Wartenberg" }

    description do
      %( Der Podcast über und um den Markt Wartenberg
    und noch mehr blah)
    end

    language { :de }
    seo_keywords { %w[Podcast Wartenberg Oberbayern München Bayern Regional] }

    author { "Michael Deimel, Thomas Rademacher" }

    owner {  "Michael Deimel" }

    email { "admin@wartenberger.de" }

    logo_url { "https://wartenberger-podcast.s3.eu-central-1.amazonaws.com/images/itunes-logo-1400x1400.jpg" }

    ituens_category { "News" }

    ituens_sub_category {  "Politics" }

    ituens_language { "de-de" }

    default_episode_artwork_url { "https://wartenberger-podcast.s3.eu-central-1.amazonaws.com/episode-default-logo.png" }

    about_episode_number { 1 }

    facebook_url { "https://www.facebook.com/Wartenberger-Der-Podcast-102909105061563" }

    youtube_url {  "https://www.youtube.com/channel/UCfnC8JiraR8N8QUkqzDsQFg" }

    twitter_url {  "" }

    instagram_url { "" }

    itunes_url { "" }

    spotify_url { "https://open.spotify.com/show/3EkNs5dt2Uix1oRWREyTOF" }
  end
end
