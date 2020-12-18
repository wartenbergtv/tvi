class PodcastFeedPresenter
  attr_reader :episodes

  delegate :title, to: :current_setting

  def initialize(episondes)
    @episodes = EpisodeFeedPresenter.wrap episondes
  end

  def owner_name; end

  def image_url
    # TODO
    "http://gr-podcast.s3.amazonaws.com/#{@show.slug}-1400.jpg"
  end

  private

  def current_setting
    @current_setting ||= Setting.new
  end
end
