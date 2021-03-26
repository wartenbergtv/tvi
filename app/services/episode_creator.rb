class EpisodeCreator < BaseService
  CREATABLE_ATTRIBUTES = %w[
    title
    description
    published_on
    nodes
    number
    active
    youtube_key
  ].freeze

  attr_accessor(*CREATABLE_ATTRIBUTES)

  validates(:title, presence: true)
  validates(:description, presence: true)
  validates(:youtube_key, presence: true, url: true)
  validates(:number, presence: true)
  validates(:published_on, presence: true)

  def initialize(attributes = {})
    super
    @active ||= true
    @number ||= Episode.maximum(:number).to_i + 1
  end

  def call
    @published_on = published_on.present? ? published_on.to_date : nil
    return false if invalid?

    episode = ::Episode.new episode_attributes.merge(slug: build_slug)
    if episode.invalid?
      errors.merge! episode.errors
      return false
    end
    episode.save!
    episode
  end

  private

  def build_slug
    "#{number.to_s.rjust(3, "0")} #{title}".parameterize
  end

  def episode_attributes
    CREATABLE_ATTRIBUTES.map { |name| [name, send(name)] if send(name) }.compact.to_h
  end
end
