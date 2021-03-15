class RemoveFileDefaults < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:episodes, :file_size,   true)
    change_column_null(:episodes, :file_duration, true)

    remove_index :episodes, :file_url
  end
end
