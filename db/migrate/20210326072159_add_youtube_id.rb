class AddYoutubeId < ActiveRecord::Migration[6.1]
  def change
    add_column :episodes, :youtube_key, :string
  end
end
