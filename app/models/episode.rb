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
class Episode < ApplicationRecord
  ATTRIBUTES = %i[title description file_url published_at].freeze
end
