class WelcomeController < ApplicationController
  def index
    @episodes = EpisodePresenter.wrap Episode.published.limit(3)

    @last_episode = @episodes.first
  end

  def imprint; end

  def privacy; end

  def epsiode
    epsiode_id = params[:id].to_i.positive? ? params[:id].to_i : nil
    episode_record = Episode.find_by(number: epsiode_id) if epsiode_id

    if episode_record
      redirect_to episode_path slug: episode_record.slug
    else
      redirect_to "/404"
    end
  end

  def about
    episode_number = current_setting.about_episode_number.presence
    episode = Episode.find_by(number: episode_number)
    @about_episode = episode ? EpisodePresenter.new(episode) : nil
  end
end
