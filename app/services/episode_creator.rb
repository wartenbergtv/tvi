class EpisodeCreator < BaseService
  attr_accessor(*Episode::ATTRIBUTES)

  validates(:title, presence: true)
  validates(:description, presence: true)
  validates(:file_url, presence: true)
  def call
    return false if invalid?

    ::Episode.create! episode_attributes.merge(slug: build_slug)
  end

  private

  def build_slug
    counter = (Episode.count + 1)
    "#{counter.to_s.rjust(3, '0')}-#{title}"
  end

  def episode_attributes
    Episode::ATTRIBUTES.map { |name| [name, send(name)] if send(name) }.compact.to_h
  end
end
