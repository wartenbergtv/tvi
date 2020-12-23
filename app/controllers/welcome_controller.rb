class WelcomeController < ApplicationController
  def index
    @episodes = EpisodePresenter.wrap Episode.active.order("number DESC").limit(3)

    @last_episode = @episodes.first
  end

  def imprint
    render html: markdown_processor.render(current_setting.imprint).html_safe, layout: true
  end

  def privacy
    render html: markdown_processor.render(current_setting.privacy).html_safe, layout: true
  end

  def about
    episode_number = current_setting.about_episode_number.presence
    episode = Episode.find_by(number: episode_number)
    @about_episode = episode ? EpisodePresenter.new(episode) : nil
  end
end
