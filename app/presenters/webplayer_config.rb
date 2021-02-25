class WebplayerConfig
  attr_reader :episode, :options

  def initialize(episode, options={})
    @episode = episode
    @options = options
  end

  # https://github.com/podigee/podigee-podcast-player/blob/master/docs/configuration.md
  def to_json(*_args)
    {
      options: {
        # https://github.com/podigee/podigee-podcast-player/blob/master/docs/theming.md
        theme: options.fetch(:theme, "default"),
        startPanel: "ChapterMarks" },
      extensions: {
        ChapterMarks: {},
        # EpisodeInfo: {},
        # Playlist: {},
        # Transcript: {},
        SubscribeBar: {}
                  },
      episode: { media: {
                   mp3: episode.mp3_url
                  },
                 coverUrl: nil, #episode.artwork_url,
                 title:  (@options[:title] ? episode.title : nil),
                 subtitle: nil,
                 url: episode.episonde_url,
                 description: (@options[:info] ? episode.description : nil),
                 chaptermarks: nil }
      }.to_json
  end
end
