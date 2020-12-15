# == Schema Information
#
# Table name: episodes
#
#  id              :bigint           not null, primary key
#  description     :text             not null
#  downloads_count :integer
#  file_url        :text
#  published_at    :datetime
#  slug            :string           not null
#  title           :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_episodes_on_file_url      (file_url) UNIQUE
#  index_episodes_on_published_at  (published_at)
#  index_episodes_on_slug          (slug) UNIQUE
#  index_episodes_on_title         (title) UNIQUE
#
FactoryBot.define do
  factory :episode do
    title { "MyString" }
    slug { "MyString" }
    description { "MyText" }
    file_url { "MyText" }
    downloads_count { 1 }
    published_at { "2020-12-15 12:27:56" }
  end
end
