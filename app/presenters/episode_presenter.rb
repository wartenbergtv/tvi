class EpisodePresenter < ApplicationPresenter
  def published_on
    h.format_date o.published_on
  end

  def mp3_url
    Rails.application.routes.url_helpers.episode_url(o, format: :mp3)
  end
end
