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

ActiveRecord::Schema.define(version: 2020_09_03_160833) do

  create_table "events", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.string "subject"
    t.string "homework"
    t.boolean "allday"
    t.bigint "student_id"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "title"
    t.index ["student_id"], name: "index_events_on_student_id"
    t.index ["teacher_id"], name: "index_events_on_teacher_id"
  end

  create_table "exam_subjects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "exam_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_exam_subjects_on_exam_id"
  end

  create_table "exams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "subject"
    t.integer "score"
    t.float "deviation"
    t.string "judge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "student_id", null: false
    t.bigint "teacher_id", null: false
    t.index ["student_id"], name: "index_exams_on_student_id"
    t.index ["teacher_id"], name: "index_exams_on_teacher_id"
  end

  create_table "learning_histories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.time "learning_time"
    t.string "learning_text"
    t.text "comment"
    t.string "subject"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_learning_histories_on_student_id"
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "comment"
    t.bigint "student_id"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_messages_on_student_id"
    t.index ["teacher_id"], name: "index_messages_on_teacher_id"
  end

  create_table "students", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "full_name"
    t.string "school_of_choice"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "image"
    t.string "subject"
    t.index ["teacher_id"], name: "index_students_on_teacher_id"
  end

  create_table "teachers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "full_name"
    t.string "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "image"
  end

  create_table "tests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "score"
    t.string "grade"
    t.float "average_score"
    t.bigint "teacher_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.index ["student_id"], name: "index_tests_on_student_id"
    t.index ["teacher_id"], name: "index_tests_on_teacher_id"
  end

  add_foreign_key "events", "students"
  add_foreign_key "events", "teachers"
  add_foreign_key "exam_subjects", "exams"
  add_foreign_key "exams", "students"
  add_foreign_key "exams", "teachers"
  add_foreign_key "learning_histories", "students"
  add_foreign_key "messages", "students"
  add_foreign_key "messages", "teachers"
  add_foreign_key "students", "teachers"
  add_foreign_key "tests", "students"
  add_foreign_key "tests", "teachers"
end
