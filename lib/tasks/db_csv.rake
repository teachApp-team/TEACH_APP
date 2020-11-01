require 'csv'
require 'fileutils'

namespace :db_csv do
  task files: :environment do
    FileUtils.touch('db-students.csv')
    FileUtils.touch('db-teachers.csv')
    FileUtils.touch('db-learning_histories.csv')
    FileUtils.touch('db-messages.csv')
    FileUtils.touch('db-questions.csv')
    FileUtils.touch('db-replies.csv')
    FileUtils.touch('db-wordbooks.csv')
    FileUtils.touch('db-words.csv')
    FileUtils.touch('db-word_tests.csv')
  end
  task export: :environment do 
    CSV.open("db-students.csv", "w") do |csv|
      column_names = Student.column_names
      csv << column_names
      Student.all.each do |student|
        csv << student.attributes.values_at(*Student.column_names)
      end
      puts "student ok"
    end

    CSV.open("db-teachers.csv", "w") do |csv|
      column_names = Teacher.column_names
      csv << column_names
      Teacher.all.each do |teacher|
        csv << teacher.attributes.values_at(*Teacher.column_names)
      end
      puts "teacher ok"
    end

    CSV.open("db-learning_histories.csv", "w") do |csv|
      column_names = LearningHistory.column_names
      csv << column_names
      LearningHistory.all.each do |lh|
        csv << lh.attributes.values_at(*LearningHistory.column_names)
      end
      puts "leaning history ok"
    end
    CSV.open("db-message.csv", "w") do |csv|
      column_names = Message.column_names
      csv << column_names
      Message.all.each do |record|
        csv << record.attributes.values_at(*Message.column_names)
      end
      puts "messages ok"
    end
    CSV.open("db-questions.csv", "w") do |csv|
      column_names = Question.column_names
      csv << column_names
      Question.all.each do |record|
        csv << record.attributes.values_at(*Question.column_names)
      end
      puts "question ok"
    end
    CSV.open("db-replies.csv", "w") do |csv|
      column_names = Reply.column_names
      csv << column_names
      Reply.all.each do |record|
        csv << record.attributes.values_at(*Reply.column_names)
      end
      puts "reply ok"
    end
    CSV.open("db-wordbooks.csv", "w") do |csv|
      column_names = Wordbook.column_names
      csv << column_names
      Wordbook.all.each do |record|
        csv << record.attributes.values_at(*Wordbook.column_names)
      end
      puts "wordbook ok"
    end
    CSV.open("db-words.csv", "w") do |csv|
      column_names = Word.column_names
      csv << column_names
      Word.all.each do |record|
        csv << record.attributes.values_at(*Word.column_names)
      end
      puts "word ok"
    end
    CSV.open("db-word_tests.csv", "w") do |csv|
      column_names = WordTest.column_names
      csv << column_names
      WordTest.all.each do |record|
        csv << record.attributes.values_at(*WordTest.column_names)
      end
      puts "word_test ok"
    end

  end









  task import: :environment do
    CSV.foreach("db-teacher.csv", headers: true) do |row|
      Teacher.create!({
        full_name: row[1],
        subject: row[2],
        password: 'password',
        password_confirmation: 'password',
        image: "",
      })
    end
    puts "teacher ok"

    CSV.foreach("db-student.csv", headers: true) do |row|
      Student.create!({
        full_name: row[1],
        school_of_choice: row[2],
        password: 'password',
        password_confirmation: 'password',
        teacher_id: 1, 
        image: "",
      })
    end
    puts "student ok"
    

  end
end