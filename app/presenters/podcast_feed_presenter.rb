# https://github.com/prashaantt/savitri/blob/master/app/views/audios/index.rss.builder

class PodcastFeedPresenter
  attr_reader :episodes

  delegate_missing_to :current_setting

  def initialize(episondes)
    @episodes = EpisodeFeedPresenter.wrap episondes
  end

  private

  def current_setting
    @current_setting ||= Setting.last
  end
end
