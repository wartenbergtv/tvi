module Admin
  class EpisodesController < BaseController
    def index
      @episode_records = Episode.order("number desc")
      @episodes        = EpisodePresenter.wrap @episode_records
    end

    def new
      @episode_creator = EpisodeCreator.new
    end

    def edit
      episode = find_episode
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
      episode = Episode.find params[:id] # no slug given during the update
      @episode_updater = EpisodeUpdater.new(update_params.merge(episode: episode))

      if @episode_updater.call
        redirect_to admin_episodes_path, notice: "Episode was successfully updated."
      else
        render :edit
      end
    end

    protected

    def find_episode
      Episode.find_by!(slug: params[:id])
    end

    def create_params
      params.require(:episode_creator).permit(*EpisodeCreator::CREATABLE_ATTRIBUTES)
    end

    def update_params
      params.require(:episode_updater).permit(*(EpisodeUpdater::UPDATEABLE_ATTRIBUTES + [:slug]))
    end
  end
end
