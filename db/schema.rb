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

ActiveRecord::Schema.define(version: 20160923190645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chat_rooms", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "recipient_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.integer  "job_post_id"
    t.integer  "user_id"
    t.text     "information"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "job_posts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "time"
    t.string   "salary"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.date     "birthdate"
    t.string   "days"
    t.integer  "user_id"
    t.date     "desired_enrollment_date"
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "chat_room_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "gender"
    t.string   "age"
    t.boolean  "cpr"
    t.boolean  "first_aid"
    t.boolean  "trustline"
    t.boolean  "comfortable_with_pets"
    t.text     "description"
    t.string   "preferred_age_group"
    t.string   "education"
    t.string   "languages"
    t.string   "type_of_job"
    t.string   "availability"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "review"
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "user_type"
    t.string   "address"
    t.string   "image_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "phone_no"
    t.string   "last_name"
    t.float    "latitude"
    t.float    "longitude"
  end

end
