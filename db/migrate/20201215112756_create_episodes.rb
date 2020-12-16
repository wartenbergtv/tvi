class CreateEpisodes < ActiveRecord::Migration[6.1]
  def change
    create_table :episodes do |t|
      t.string :title, null: false, index: { unique: true }
      t.string :slug, null: false, index: { unique: true }
      t.text :description, null: false
      t.text :file_url, index: { unique: true }
      t.integer :downloads_count, default: 0
      t.datetime :published_at, index: true

      t.timestamps
    end
  end
end
