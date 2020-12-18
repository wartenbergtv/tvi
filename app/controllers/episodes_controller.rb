class EpisodesController < ApplicationController
  def index
    @episodes_records = Episode.all.paginate(page: params[:page], per_page: params[:per_page])
    @episodes = EpisodePresenter.wrap @episodes_records
  end

  def show
    episode_record = Episode.find_by(slug: params[:slug]) || not_found
    @episode = EpisodePresenter.new episode_record
  end
end
