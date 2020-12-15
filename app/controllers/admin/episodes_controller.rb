module Admin
  class EpisodesController < ApplicationController
    def index
      @episode_records = Episode.all
      @episodes        = EpisodePresenter.wrap @episode_record
    end

    def show
      @episode = EpisodePresenter.new Episode.find(params[:id])
    end

    def new
      @episode = Episode.new
    end

    def edit; end

    def create
      @episode_creator = EpisodeCreator(episode_params)

      respond_to do |format|
        if episode_creator.call
          format.html { redirect_to @episode, notice: "Episode was successfully created." }
        else
          format.html { render :new }
        end
      end
    end

    def update
      @episode = Episode.find(params[:id])
      respond_to do |format|
        if @episode.update(episode_params)
          format.html { redirect_to @episode, notice: "Episode was successfully updated." }
        else
          format.html { render :edit }
        end
      end
    end

    private

    def episode_params
      params.require(:episode).permit(*Episode::ATTRIBUTES)
    end
  end
end
