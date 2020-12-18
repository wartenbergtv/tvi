class AddFileSizeAndFileDurationToEpisodes < ActiveRecord::Migration[6.1]
  def change
    add_column :episodes, :file_size, :integer, null: false
    add_column :episodes, :file_duration, :integer, null: false
  end
end
