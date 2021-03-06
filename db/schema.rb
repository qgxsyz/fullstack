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

ActiveRecord::Schema.define(version: 20171206160543) do

  create_table "answer_like_relationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "answer_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "answer_id"
    t.integer  "user_id"
    t.integer  "assignment_id"
    t.text     "content",       limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "assignment_relationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "assignment_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "assignments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "assignment_name"
    t.text     "description",     limit: 65535
    t.integer  "section_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "chapters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "chapter_name"
    t.integer  "learning_time"
    t.integer  "course_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "course_name"
    t.string   "course_img"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "category"
    t.boolean  "is_locked"
    t.string   "abstract"
  end

  create_table "favorites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "section_relationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "section_id"
    t.integer  "user_id"
    t.boolean  "has_learned"
    t.boolean  "has_collected"
    t.integer  "feel"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "sections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "section_name"
    t.boolean  "is_exist_video"
    t.integer  "chapter_id"
    t.text     "content",        limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "is_admin",               default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
