class EpisodePresenter < ApplicationPresenter
  def published?
    o.active? && !o.published_on.future?
  end

  def number
    o.number.to_s.rjust(3, "0")
  end

  def published_on
    h.format_date o.published_on
  end

  def youtube_link
    "https://www.youtube.com/watch?v=#{o.youtube_key}"
  end

  def artwork_url
    "https://img.youtube.com/vi/#{o.youtube_key}/0.jpg"
  end

  def file_duration
    o.duration
  end

  def cdn_url
    if Rails.application.config.active_storage.service == :aws && Rails.application.config.aws_cloudfront_url
      File.join(Rails.application.config.aws_cloudfront_url, o.audio.blob.key)
    else
      route = o.audio.blob.is_a?(ActiveStorage::Variant) ? :rails_representation : :rails_blob
      Rails.application.routes.url_helpers.route_for(route, o.audio.blob)
    end
  end

  def file_url
    cdn_url
  end

  def file_size
    o.audio_size
  end

  def mp3_url
    Rails.application.routes.url_helpers.episode_url(o, format: :mp3)
  end

  def episonde_url
    # This is used when an episode has a corresponding webpage. For example:
    Rails.application.routes.url_helpers.episode_url(o)
  end

  def audio_size_formatted
    h.number_to_human_size file_size
  end

  def duration_formatted
    h.format_duration seconds: file_duration if file_duration
  end
end
