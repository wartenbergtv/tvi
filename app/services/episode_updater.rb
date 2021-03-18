class EpisodeUpdater < BaseService
  UPDATEABLE_ATTRIBUTES = %w[title
    description
    nodes
    active
    chapter_marks
    audio
    image
    published_on].freeze

  attr_accessor(*UPDATEABLE_ATTRIBUTES, :episode)

  delegate :id, to: :episode

  validates(:episode, :title, :description, :nodes, :published_on, presence: true)

  # validates(:artwork_url, presence: true, url: true)
  # validates(:audio, presence: true)
  # validates(:image, presence: true)

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
