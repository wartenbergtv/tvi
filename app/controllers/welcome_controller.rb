class WelcomeController < ApplicationController
  def index
    @episodes = EpisodePresenter.wrap Episode.published.limit(2)

    @last_episode = @episodes.first
  end

  def imprint; end

  def privacy; end

  def about
    episode_number = current_setting.about_episode_number.presence
    episode = Episode.find_by(number: episode_number)
    @about_episode = episode ? EpisodePresenter.new(episode) : nil
  end
end
