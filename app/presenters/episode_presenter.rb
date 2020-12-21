class EpisodePresenter < ApplicationPresenter
  def number
    o.number.to_s.rjust(3, "0")
  end

  def published_on
    h.format_date o.published_on
  end

  def mp3_url
    Rails.application.routes.url_helpers.episode_url(o, format: :mp3)
  end
end
