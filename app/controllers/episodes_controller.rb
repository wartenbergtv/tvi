class EpisodesController < ApplicationController
  def index
    @episodes_records = Episode.all.paginate(page: params[:page], per_page: params[:per_page])
    @episodes = EpisodePresenter.wrap @episodes_records
  end

  def show; end
end
