class EpisodePresenter < ApplicationPresenter
  def published_on
    h.format_date o.published_on
  end
end
