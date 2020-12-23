class WelcomeController < ApplicationController
  def index
    @episodes = EpisodePresenter.wrap Episode.published.limit(3)

    @last_episode = @episodes.first
  end

  def imprint
    render html: markdown_processor.render(current_setting.imprint).html_safe, layout: true
  end

  def privacy
    render html: markdown_processor.render(current_setting.privacy).html_safe, layout: true
  end

  def about; end
end
