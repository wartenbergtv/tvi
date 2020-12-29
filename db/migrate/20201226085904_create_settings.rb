class CreateSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :settings do |t|
      t.string :title, null: false
      t.text :short_description, null: false
      t.text :description, null: false
      t.string :language, null: false, defult: :de
      t.text :seo_keywords

      t.string :author, null: false
      t.string :owner, null: false
      t.string :email, null: false
      t.string :logo_url, null: false
      t.string :default_episode_artwork_url, null: false
      t.string :ituens_category, null: false
      t.string :ituens_sub_category, null: false
      t.string :ituens_language, null: false

      t.integer :about_episode_number, null: false

      t.string :facebook_url
      t.string :youtube_url
      t.string :twitter_url
      t.string :instagram_url
      t.string :itunes_url
      t.string :spotify_url
      t.string :google_url
      t.timestamps
    end
  end
end
