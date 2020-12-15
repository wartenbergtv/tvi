class EpisodeCreator < BaseService
  attr_accessor(*Episode::ATTRIBUTES)

  validates(*Episode::ATTRIBUTES, presence: true)

  def call
    return false if invalid?

    ::Episode.create! episode_attributes
  end

  private

  def episode_attributes
    Episode::ATTRIBUTES.map { |name| [name, send(name)] if send(name) }.compact.to_h
  end
end
