class EpisodeFeedPresenter < EpisodePresenter
  delegate :author, to: :current_setting

  def duration
    # Different duration formats are accepted however
    # it is recommended to convert the length of the episode into seconds.
    o.file_duration
  end

  def audio_type
    #  The type attribute provides the correct category for the type of file you are using.
    # The type values for the supported file formats are:
    # audio/x-m4a, audio/mpeg, video/quicktime, video/mp4, video/x-m4v, and application/pdf.
    "audio/mpeg"
  end

  def length
    # The length attribute is the file size in bytes.
    # You can find this information in the properties of your podcast file
    o.file_size
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
    mp3_url
  end

  def description
    h.truncate(o.description, length: 4000)
  end

  def pub_date
    # # The date and time when an episode was released. RFC 2822
    o.published_on.to_date.rfc822
  end
end
