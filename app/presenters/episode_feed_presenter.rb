class EpisodeFeedPresenter < ApplicationPresenter
  delegate :author, to: :current_setting

  def subtitle
    o.title
  end

  def file_url
    # TODO
    # he URL attribute points to your podcast media file.
    # The file extension specified within the URL attribute determines whether or
    #  not content appears in the podcast directory.
    # Supported file formats include M4A, MP3, MOV, MP4, M4V, and PDF.
    Rails.application.routes.url_helpers.episode_url(o, format: :mp3)
  end

  def file_size
    # TODO
    # The length attribute is the file size in bytes.
    # You can find this information in the properties of your podcast file
  end

  def file_type
    #  The type attribute provides the correct category for the type of file you are using.
    # The type values for the supported file formats are:
    # audio/x-m4a, audio/mpeg, video/quicktime, video/mp4, video/x-m4v, and application/pdf.
    "audio/mpeg"
  end

  def guid
    # The episode’s globally unique identifier (GUID).
    # It is very important that each episode have a unique GUID and that it never changes, even if an episode’s metadata,
    # like title or enclosure URL, do change.
    # Globally unique identifiers (GUID) are case-sensitive strings.
    # If a GUID is not provided an episode’s enclosure URL will be used instead.
    # If a GUID is not provided, make sure that an episode’s enclosure URL is unique and never changes.
    # Failing to comply with these guidelines may result in duplicate episodes being shown to listeners,
    # inaccurate data in Podcast Analytics,
    # and can cause issues with your podcasts’s listing and chart placement in Apple Podcasts.
    file_url
  end

  def episonde_url
    # This is used when an episode has a corresponding webpage. For example:
    # <link>
    #   http://www.mypodcast.com/episode-one.html
    # </link>
    # TODO
    Rails.application.routes.url_helpers.episode_url(o)
  end

  def description
    h.truncate(o.description, length: 4000)
  end

  def artwork_url
    # TODO
    # You should use this tag when you have a high quality,
    # episode-specific image you would like listeners to see.
    # "http://gr-podcast.s3.amazonaws.com/#{episode.show.slug}-1400.jpg"
  end

  def duration
    # TODO
    # Different duration formats are accepted however
    # it is recommended to convert the length of the episode into seconds.
  end

  def pub_date
    # # The date and time when an episode was released. RFC 2822
    o.published_on.to_date.rfc822
  end

  private

  def current_setting
    @current_setting ||= Setting.last
  end
end
