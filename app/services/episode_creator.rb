class EpisodeCreator < BaseService
  include ActiveModel::Attributes
  CREATABLE_ATTRIBUTES = %w[title description file_url published_on file_size file_duration nodes number active].freeze

  attr_accessor(*(CREATABLE_ATTRIBUTES - %w[number]))

  attribute :number, :integer, default: -> { (Episode.count + 1) }

  validates(:title, presence: true)
  validates(:description, presence: true)
  validates(:file_url, presence: true)
  validates(:number, presence: true)
  validates(:published_on, presence: true)
  validates(:file_size, presence: true)
  validates(:file_duration, presence: true)

  def call
    @published_on = published_on.present? ? published_on.to_date : nil
    return false if invalid?

    ::Episode.create! episode_attributes.merge(slug: build_slug)
  end

  private

  def build_slug
    "#{number.to_s.rjust(3, '0')} #{title}".parameterize
  end

  def episode_attributes
    CREATABLE_ATTRIBUTES.map { |name| [name, send(name)] if send(name) }.compact.to_h
  end
end
