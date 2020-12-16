class WelcomeController < ApplicationController
  def index
    @episodes = EpisodePresenter.wrap Episode.last(5)
  end
end
