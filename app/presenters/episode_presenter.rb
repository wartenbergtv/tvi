class EpisodePresenter < ApplicationPresenter

  def published_at
    h.format_datetime o.published_at
  end
end
