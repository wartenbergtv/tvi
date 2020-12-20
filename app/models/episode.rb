# == Schema Information
#
# Table name: episodes
#
#  id              :bigint           not null, primary key
#  active          :boolean          default(TRUE)
#  description     :text             not null
#  downloads_count :integer          default(0)
#  file_duration   :integer          not null
#  file_size       :integer          not null
#  file_url        :text
#  node            :text
#  published_on    :date
#  slug            :string           not null
#  title           :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_episodes_on_file_url      (file_url) UNIQUE
#  index_episodes_on_published_on  (published_on)
#  index_episodes_on_slug          (slug) UNIQUE
#  index_episodes_on_title         (title) UNIQUE
#
class Episode < ApplicationRecord
  def to_param
    slug
  end

  scope :active, -> { where(active: true) }
end
