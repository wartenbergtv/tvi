class EpisodeCreator < BaseService
  CREATABLE_ATTRIBUTES = %w[title description file_url published_on].freeze

  attr_accessor(*CREATABLE_ATTRIBUTES)

  validates(:title, presence: true)
  validates(:description, presence: true)
  validates(:file_url, presence: true)
  # validates(:published_on, presence: true) # TODO

  def call
    @published_on = published_on.present? ? published_on.to_date : nil
    return false if invalid?

    ::Episode.create! episode_attributes.merge(slug: build_slug)
  end

  private

  def build_slug
    counter = (Episode.count + 1)
    "#{counter.to_s.rjust(3, '0')}-#{title}"
  end

  def episode_attributes
    CREATABLE_ATTRIBUTES.map { |name| [name, send(name)] if send(name) }.compact.to_h
  end
end
