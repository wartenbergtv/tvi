xml.item do
  # An episode title
  xml.title episode.title

  # The episode content, file size, and file type information.
  xml.enclosure(url: episode.file_url, length: episode.file_size, type: episode.file_type)

  # The episode’s globally unique identifier (GUID)
  xml.guid episode.guid

  # The date and time when an episode was released.  RFC 2822
  xml.pubDate episode.pub_date

  # An episode description. max 4000
  xml.description episode.description

  # The duration of an episode.
  xml.tag! "itunes:duration", episode.duration

  # An episode link URL.
  xml.link episode.episonde_url

  # The episode artwork.
  xml.tag! "itunes:image", href: episode.artwork_url

  # The episode parental advisory information.
  xml.tag! "itunes:explicit", false

end
