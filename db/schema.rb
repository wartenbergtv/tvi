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

ActiveRecord::Schema.define(version: 20_201_215_112_756) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "episodes", force: :cascade do |t|
    t.string "title", null: false
    t.string "slug", null: false
    t.text "description", null: false
    t.text "file_url"
    t.integer "downloads_count"
    t.datetime "published_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["file_url"], name: "index_episodes_on_file_url", unique: true
    t.index ["published_at"], name: "index_episodes_on_published_at"
    t.index ["slug"], name: "index_episodes_on_slug", unique: true
    t.index ["title"], name: "index_episodes_on_title", unique: true
  end
end
