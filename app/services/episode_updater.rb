class EpisodeUpdater < BaseService
  UPDATEABLE_ATTRIBUTES = %w[title description file_url].freeze

  attr_accessor(*UPDATEABLE_ATTRIBUTES, :episode)

  delegate :id, to: :episode

  validates(*UPDATEABLE_ATTRIBUTES, presence: true)
  validates(:episode, presence: true)

  def call
    return false if invalid?

    episode.update! episode_attributes
  end

  private

  def episode_attributes
    UPDATEABLE_ATTRIBUTES.map { |name| [name, send(name)] if send(name) }.compact.to_h
  end
end
