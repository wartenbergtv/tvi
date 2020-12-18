class EpisodesController < ApplicationController
  def index
    @episodes_records = Episode.all.paginate(page: params[:page], per_page: params[:per_page])
    @episodes = EpisodePresenter.wrap @episodes_records

    respond_to do |format|
      format.html
      format.rss do
        @feed = PodcastFeedPresenter.new(@episodes)
        render layout: false, content_type: "application/xml"
      end
    end
  end

  def show
    episode_record = Episode.find_by(slug: params[:slug]) || not_found
    @episode = EpisodePresenter.new episode_record
    respond_to do |format|
      format.html
      format.mp3 do
        episode_record.increment :downloads_count
        # TODO: change if active_storage
        redirect_to @episode.file_url
      end
    end
  end
end
