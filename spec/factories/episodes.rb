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
#  file_duration   :integer          not null
#  file_size       :integer          not null
#  file_url        :text
#  nodes           :text
#  number          :integer          default(0), not null
#  published_on    :date
#  slug            :string           not null
#  title           :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_episodes_on_file_url      (file_url) UNIQUE
#  index_episodes_on_number        (number) UNIQUE
#  index_episodes_on_published_on  (published_on)
#  index_episodes_on_slug          (slug) UNIQUE
#  index_episodes_on_title         (title) UNIQUE
#
FactoryBot.define do
  factory :episode do
    sequence(:title) { |n| "Soli Wartenberg #{n}" }
    slug { "#{number.to_s.rjust(3, "0")} #{title}".parameterize }
    description { "we talk about bikes and things" }
    file_url { |_n| "https://wartenberger-podcast.s3.eu-central-1.amazonaws.com/#{slug}.mp3" }
    artwork_url { "https://wartenberger-podcast.s3.eu-central-1.amazonaws.com/#{slug}.jpg" }
    downloads_count { 1 }
    file_size { 123 }
    file_duration { 321 }
    published_on { Time.current.to_date }
    sequence(:number)
  end
end
