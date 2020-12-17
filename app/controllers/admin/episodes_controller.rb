module Admin
  class EpisodesController < ApplicationController
    def index
      @episode_records = Episode.all
      @episodes        = EpisodePresenter.wrap @episode_records
    end

    def show
      raise "test"
      @episode = EpisodePresenter.new Episode.find(params[:id])
    end

    def new
      @episode_creator = EpisodeCreator.new
    end

    def edit
      episode = Episode.find(params[:id])
      attributes = episode.slice(*EpisodeUpdater::UPDATEABLE_ATTRIBUTES)
      @episode_updater = EpisodeUpdater.new attributes.merge(episode: episode)
    end

    def create
      @episode_creator = EpisodeCreator.new(create_params)
      if @episode_creator.call
        redirect_to admin_episodes_path, notice: "Episode was successfully created."
      else
        render :new
      end
    end

    def update
      episode = Episode.find(params[:id])
      @episode_updater = EpisodeUpdater.new(update_params.merge(episode: episode))

      if @episode_updater.call
        redirect_to admin_episodes_path, notice: "Episode was successfully updated."
      else
        render :edit
      end
    end

    protected

    def create_params
      params.require(:episode_creator).permit(*EpisodeCreator::CREATABLE_ATTRIBUTES)
    end

    def update_params
      params.require(:episode_updater).permit(*EpisodeUpdater::UPDATEABLE_ATTRIBUTES)
    end
  end
end
