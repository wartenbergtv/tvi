class ImportDefaultSetting < ActiveRecord::Migration[6.1]
  def up
    Setting.create! do |setting|
      setting.title = "Wartenberger Podcast"

      setting.description = "Der Podcast über und um den Markt Wartenberg"

      setting.language = :de

      setting.seo_keywords = %w[Podcast Wartenberg Oberbayern München Bayern Regional].join(",")

      setting.author = "Michael Deimel, Thomas Rademacher"

      setting.owner = "Michael Deimel"

      setting.email = "admin@wartenberger.de"

      setting.logo_url = "https://wartenberger-podcast.s3.eu-central-1.amazonaws.com/images/itunes-logo-1400x1400.jpg"

      setting.itunes_category = "News"

      setting.itunes_sub_category = "Politics"

      setting.itunes_language = "de-de"

      setting.default_episode_artwork_url = "https://wartenberger-podcast.s3.eu-central-1.amazonaws.com/episode-default-logo.png"

      setting.about_episode_number = 1

      setting.facebook_url = "https://www.facebook.com/Wartenberger-Der-Podcast-102909105061563"

      setting.youtube_url = "https://www.youtube.com/channel/UCfnC8JiraR8N8QUkqzDsQFg"

      setting.spotify_url = "https://open.spotify.com/show/3EkNs5dt2Uix1oRWREyTOF"

      setting.itunes_url = "https://podcasts.apple.com/de/podcast/wartenberger-podcast/id1546458413"
    end
  end
end
