# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_29_102934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "episodes", force: :cascade do |t|
    t.string "title", null: false
    t.string "slug", null: false
    t.text "description", null: false
    t.text "file_url"
    t.integer "downloads_count", default: 0
    t.date "published_on"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "file_size", null: false
    t.integer "file_duration", null: false
    t.text "nodes"
    t.boolean "active", default: true
    t.integer "number", default: 0, null: false
    t.string "artwork_url"
    t.index ["file_url"], name: "index_episodes_on_file_url", unique: true
    t.index ["number"], name: "index_episodes_on_number", unique: true
    t.index ["published_on"], name: "index_episodes_on_published_on"
    t.index ["slug"], name: "index_episodes_on_slug", unique: true
    t.index ["title"], name: "index_episodes_on_title", unique: true
  end

  create_table "settings", force: :cascade do |t|
    t.string "title", null: false
    t.text "short_description", null: false
    t.text "description", null: false
    t.string "language", null: false
    t.text "seo_keywords"
    t.string "author", null: false
    t.string "owner", null: false
    t.string "email", null: false
    t.string "logo_url", null: false
    t.string "default_episode_artwork_url", null: false
    t.string "ituens_category", null: false
    t.string "ituens_sub_category", null: false
    t.string "ituens_language", null: false
    t.integer "about_episode_number", null: false
    t.string "facebook_url"
    t.string "youtube_url"
    t.string "twitter_url"
    t.string "instagram_url"
    t.string "itunes_url"
    t.string "spotify_url"
    t.string "google_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
