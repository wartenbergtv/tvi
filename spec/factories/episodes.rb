# == Schema Information
#
# Table name: episodes
#
#  id              :bigint           not null, primary key
#  active          :boolean          default(TRUE)
#  artwork_url     :string
#  chapter_marks   :text
#  description     :text             not null
#  downloads_count :integer          default(0)
#  nodes           :text
#  number          :integer          default(0), not null
#  published_on    :date
#  slug            :string           not null
#  title           :string           not null
#  youtube_key     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_episodes_on_number        (number) UNIQUE
#  index_episodes_on_published_on  (published_on)
#  index_episodes_on_slug          (slug) UNIQUE
#  index_episodes_on_title         (title) UNIQUE
#
FactoryBot.define do
  factory :episode do
    sequence(:title) { |n| "My Video #{n}" }
    slug { "#{number.to_s.rjust(3, "0")} #{title}".parameterize }
    description { "we show somethings" }
    downloads_count { 1 }
    published_on { Time.current.to_date }
    sequence(:number)
  end
end
