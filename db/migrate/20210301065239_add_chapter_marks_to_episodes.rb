class AddChapterMarksToEpisodes < ActiveRecord::Migration[6.1]
  def change
    add_column :episodes, :chapter_marks, :text
  end
end
