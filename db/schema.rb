# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_07_18_153213) do

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.integer "running_time"
    t.integer "rating"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "user_id"
    t.integer "showtime_id"
    t.integer "num_tickets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["showtime_id"], name: "index_purchases_on_showtime_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "showtimes", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "theater_id"
    t.string "time"
    t.integer "seats_available"
    t.integer "tickets_sold"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_showtimes_on_movie_id"
    t.index ["theater_id"], name: "index_showtimes_on_theater_id"
  end

  create_table "theaters", force: :cascade do |t|
    t.string "name"
    t.integer "zip"
    t.text "description"
    t.decimal "ticket_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
