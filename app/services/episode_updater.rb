class EpisodeUpdater < BaseService
  UPDATEABLE_ATTRIBUTES = %w[title
    description
    nodes
    active
    artwork_url
    chapter_marks
    audio
    published_on].freeze

  attr_accessor(*UPDATEABLE_ATTRIBUTES, :episode)

  delegate :id, to: :episode

  validates(:title, :description, :nodes, :artwork_url, :published_on, presence: true)
  validates(:episode, presence: true)
  validates(:artwork_url, url: true)

  def call
    @published_on = published_on.present? ? published_on.to_date : nil
    return false if invalid?

    episode.assign_attributes episode_attributes.merge(slug: build_slug)
    if episode.invalid?
      errors.merge! episode.errors
      return false
    end
    episode.save!
    episode
  end

  private

  def build_slug
    "#{episode.number.to_s.rjust(3, "0")} #{title}".parameterize
  end

  def episode_attributes
    UPDATEABLE_ATTRIBUTES.map { |name| [name, send(name)] if send(name) }.compact.to_h
  end
end
