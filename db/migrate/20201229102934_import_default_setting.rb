class ImportDefaultSetting < ActiveRecord::Migration[6.1]
  def up
    Setting.create! do |setting|
      setting.title = "Wartenberg TV"

      setting.description = "Der Sender über und um den Markt Wartenberg"

      setting.language = :de

      setting.seo_keywords = %w[Podcast Wartenberg Oberbayern München Bayern Regional].join(",")

      setting.author = "Thomas Rademacher"

      setting.owner = "Thomas Rademacher"

      setting.email = "admin@wartenberg.tv"

      setting.logo_url = "https://wartenberger-podcast.s3.eu-central-1.amazonaws.com/images/itunes-logo-1400x1400.jpg"

      setting.itunes_category = "News"

      setting.itunes_sub_category = "Politics"

      setting.itunes_language = "de-de"

      setting.default_episode_artwork_url = "https://wartenberger-podcast.s3.eu-central-1.amazonaws.com/episode-default-logo.png"

      setting.about_episode_number = 0

      setting.facebook_url = "https://www.facebook.com/WartenbergTV"

      setting.youtube_url = "https://www.youtube.com/channel/UC_qtl8DfNp0FzqYobUrT2ug"

      setting.spotify_url = ""

      setting.itunes_url = ""
    end
  end
end
