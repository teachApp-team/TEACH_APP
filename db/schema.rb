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

ActiveRecord::Schema.define(version: 2020_10_08_112448) do

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
    t.integer "score"
    t.float "deviation"
    t.string "judge"
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

  create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "learning_history_id"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["learning_history_id"], name: "index_likes_on_learning_history_id"
    t.index ["teacher_id"], name: "index_likes_on_teacher_id"
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

  create_table "questions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "teacher_id"
    t.bigint "student_id"
    t.string "category"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["student_id"], name: "index_questions_on_student_id"
    t.index ["teacher_id"], name: "index_questions_on_teacher_id"
  end

  create_table "replies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.bigint "teacher_id"
    t.bigint "student_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "which"
    t.string "image"
    t.index ["question_id"], name: "index_replies_on_question_id"
    t.index ["student_id"], name: "index_replies_on_student_id"
    t.index ["teacher_id"], name: "index_replies_on_teacher_id"
  end

  create_table "results", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "word_id"
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "word_test_id"
    t.index ["student_id"], name: "index_results_on_student_id"
    t.index ["word_id"], name: "index_results_on_word_id"
    t.index ["word_test_id"], name: "index_results_on_word_test_id"
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
    t.string "mail"
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

  create_table "word_tests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_word_tests_on_student_id"
  end

  create_table "wordbooks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "words", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "english"
    t.string "japanese"
    t.string "part"
    t.string "level"
    t.bigint "wordbook_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wordbook_id"], name: "index_words_on_wordbook_id"
  end

  add_foreign_key "events", "students"
  add_foreign_key "events", "teachers"
  add_foreign_key "exam_subjects", "exams"
  add_foreign_key "exams", "students"
  add_foreign_key "exams", "teachers"
  add_foreign_key "learning_histories", "students"
  add_foreign_key "likes", "learning_histories"
  add_foreign_key "likes", "teachers"
  add_foreign_key "messages", "students"
  add_foreign_key "messages", "teachers"
  add_foreign_key "questions", "students"
  add_foreign_key "questions", "teachers"
  add_foreign_key "replies", "questions"
  add_foreign_key "replies", "students"
  add_foreign_key "replies", "teachers"
  add_foreign_key "results", "students"
  add_foreign_key "results", "word_tests"
  add_foreign_key "results", "words"
  add_foreign_key "students", "teachers"
  add_foreign_key "tests", "students"
  add_foreign_key "tests", "teachers"
  add_foreign_key "word_tests", "students"
  add_foreign_key "words", "wordbooks"
end
