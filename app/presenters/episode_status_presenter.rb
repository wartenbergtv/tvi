class EpisodeStatusPresenter < EpisodePresenter
  def none_tracking_mp3_url
    mp3_url(notracking: true)
  end

  def audio_exist?
   return @audio_exist if defined?(@audio_exist)
   @audio_exist = RemoteFileStatus.new(url: none_tracking_mp3_url).call
  rescue
   @audio_exist = false
  end

  def image_exist?
   return @image_exist if defined?(@image_exist)

    artwork_url
    begin
      @image_exist = RemoteFileStatus.new(url: artwork_url).call
    rescue
      @audio_exist = false
    end
  end

  def valid?
    o.valid?
  end

  def status
   image_exist? && audio_exist? ? :ok : :error
  end
end
