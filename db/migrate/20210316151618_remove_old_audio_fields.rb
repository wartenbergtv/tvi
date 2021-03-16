class RemoveOldAudioFields < ActiveRecord::Migration[6.1]
  def change
    remove_column :episodes, :file_url
    remove_column :episodes, :file_size
    remove_column :episodes, :file_duration
  end
end
