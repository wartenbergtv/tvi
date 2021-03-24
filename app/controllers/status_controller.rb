class StatusController < ApplicationController
  before_action :authorize_admin

  def show
    @episode_records = Episode.order("number desc")
    @episodes = EpisodeStatusPresenter.wrap @episode_records
  end
end
