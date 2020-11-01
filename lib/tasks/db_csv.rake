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
    FileUtils.touch('db-results.csv')
    FileUtils.touch('db-old_wordbooks.csv')
    FileUtils.touch('db-old_words.csv')
    FileUtils.touch('db-old_word_tests.csv')
    FileUtils.touch('db-old_results.csv')
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
    CSV.open("db-messages.csv", "w") do |csv|
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
    CSV.open("db-results.csv", "w") do |csv|
      column_names = Result.column_names
      csv << column_names
      Result.all.each do |record|
        csv << record.attributes.values_at(*Result.column_names)
      end
      puts "result ok"
    end
    CSV.open("db-old_wordbooks.csv", "w") do |csv|
      column_names = OldWordbook.column_names
      csv << column_names
      OldWordbook.all.each do |record|
        csv << record.attributes.values_at(*OldWordbook.column_names)
      end
      puts "old wordbook ok"
    end
    CSV.open("db-old_words.csv", "w") do |csv|
      column_names = OldWord.column_names
      csv << column_names
      OldWord.all.each do |record|
        csv << record.attributes.values_at(*OldWord.column_names)
      end
      puts "old word ok"
    end
    CSV.open("db-old_word_tests.csv", "w") do |csv|
      column_names = OldWordTest.column_names
      csv << column_names
      OldWordTest.all.each do |record|
        csv << record.attributes.values_at(*OldWordTest.column_names)
      end
      puts "old word test ok"
    end
    CSV.open("db-old_results.csv", "w") do |csv|
      column_names = OldResult.column_names
      csv << column_names
      OldResult.all.each do |record|
        csv << record.attributes.values_at(*OldResult.column_names)
      end
      puts "old result ok"
    end

  end








  namespace :import do
    task teachers: :environment do
      puts "teacher start"
      begin
        CSV.foreach("db-teachers.csv", headers: true) do |row|
          Teacher.find_or_create_by!({
            id: row[0],
            full_name: row[1],
            subject: row[2],
            password: 'password',
            password_confirmation: 'password',
            image: "",
          })
          puts row[0]
        end
        puts "teacher done"
      rescue
        puts "一旦飛ばします"
      end
    end
    task students: :environment do
      puts "student start"
      begin
        CSV.foreach("db-students.csv", headers: true) do |row|
          Student.find_or_create_by!({
            id: row[0],
            full_name: row[1],
            school_of_choice: row[2],
            password: 'password',
            password_confirmation: 'password',
            teacher_id: 1, 
            image: "",
          })
          puts row[0]
          puts "student done"
        end
      rescue
        puts "一旦飛ばします"
      end
    end
    task learning_histories: :environment do
      puts "learning_histories start"
      begin
        CSV.foreach("db-learning_histories.csv", headers: true) do |row|
          LearningHistory.find_or_create_by!({
            id: row[0],
            learning_time: row[1],
            learning_text: row[2],
            comment: row[3],
            subject: row[4],
            student_id: row[5],
            created_at: row[6],
            updated_at: row[7],
          })
          puts row[0]
        end
        puts "learning_histories done"
      rescue
        puts "一旦飛ばします"
      end
    end
    task messages: :environment do
      puts "messages start"
      begin
        CSV.foreach("db-messages.csv", headers: true) do |row|
          Message.find_or_create_by!({
            id: row[0],
            comment: row[1],
            student_id: row[2],
            teacher_id: row[3],
            created_at: row[4],
            updated_at: row[5],
          })
          puts row[0]
        end
        puts "messages done"
      rescue
        puts "一旦飛ばします"
      end
    end

    task questions: :environment do
      puts "questions start"
      begin
        CSV.foreach("db-questions.csv", headers: true) do |row|
          Question.find_or_create_by!({
            id: row[0],
            teacher_id: row[1],
            student_id: row[2],
            category: row[3],
            content: row[4],
            created_at: row[5],
            updated_at: row[6],
            image: "",
          })
          puts row[0]
        end
        puts "questions done"
      rescue
        puts "一旦飛ばします"
      end
    end

    task replies: :environment do
      puts "replies start"
      begin
        CSV.foreach("db-replies.csv", headers: true) do |row|
          Reply.find_or_create_by!({
            id: row[0],
            content: row[1],
            teacher_id: row[2],
            student_id: row[3],
            question_id: row[4],
            created_at: row[5],
            updated_at: row[6],
            which: row[7],
            image: "",
          })
          puts row[0]
        end
        puts "replies done"
      rescue
        puts "一旦飛ばします"
      end
    end

    task wordbooks: :environment do
      puts "wordbooks start"
      begin
        CSV.foreach("db-wordbooks.csv", headers: true) do |row|
          Wordbook.find_or_create_by!({
            id: row[0],
            name: row[1],
          })
          puts row[0]
        end
        puts "wordbooks done"
      rescue
        puts "一旦飛ばします"
      end
    end

    task words: :environment do
      puts "words start"
<<<<<<< HEAD
      begin
        CSV.foreach("db-words.csv", headers: true) do |row|
          Word.find_or_create_by!({
            id: row[0],
            english: row[1],
            japanese: row[2],
            part: row[3],
            level: row[4],
            wordbook_id: row[5],
          })
          puts row[0]
        end
        puts "words done"
      rescue
        puts "一旦飛ばします"
=======
      CSV.foreach("db-words.csv", headers: true) do |row|
        Word.find_or_create_by!({
          english: row[1],
          japanese: row[2],
          part: row[3],
          level: row[4],
          wordbook_id: row[5],
        })
        puts row[0]
>>>>>>> deea204422a90064e84f9e83a26a82e66662aa82
      end
    end

    task word_tests: :environment do
      puts "word_tests start"
      begin
        CSV.foreach("db-word_tests.csv", headers: true) do |row|
          WordTest.find_or_create_by!({
            id: row[0],
            student_id: row[1],
            created_at: row[2],
            updated_at: row[3],
          })
          puts row[0]
        end
        puts "word_tests done"
      rescue
        puts "一旦飛ばします"
      end
    end

    task results: :environment do
      puts "results start"
<<<<<<< HEAD
      begin
        CSV.foreach("db-results.csv", headers: true) do |row|
=======
        begin
          CSV.foreach("db-results.csv", headers: true) do |row|
>>>>>>> deea204422a90064e84f9e83a26a82e66662aa82
          Result.find_or_create_by!({
            student_id: row[1],
            word_id: row[2],
            correct: row[3],
            created_at: row[4],
            updated_at: row[5],
            word_test_id: row[6],
          })
          puts row[0]
<<<<<<< HEAD
        rescue
          puts "一旦飛ばします"
        end
      end
=======
          rescue
            puts "一旦飛ばします"
          end
        end
>>>>>>> deea204422a90064e84f9e83a26a82e66662aa82
      puts "results done"
    end

    task old_wordbooks: :environment do
      puts "old_wordbooks start"
      begin
        CSV.foreach("db-old_wordbooks.csv", headers: true) do |row|
          OldWordbook.find_or_create_by!({
            id: row[0],
            name: row[1],
          })
          puts row[0]
        end
        puts "old_wordbooks done"
      rescue
        puts "一旦飛ばします"
      end
    end

    task old_words: :environment do
      puts "old_words start"
      begin
        CSV.foreach("db-old_words.csv", headers: true) do |row|
          OldWord.find_or_create_by!({
            id: row[0],
            name: row[1],
            meaning: row[2],
            kanji: row[3],
            part: row[4],
            old_wordbook_id: row[5],
          })
          puts row[0]
        end
        puts "old_words done"
      rescue
        puts "一旦飛ばします"
      end
    end

    task old_word_tests: :environment do
      puts "old_word_tests start"
      begin
        CSV.foreach("db-old_word_tests.csv", headers: true) do |row|
          OldWordTest.find_or_create_by!({
            id: row[0],
            student_id: row[1],
            created_at: row[2],
            updated_at: row[3],
          })
          puts row[0]
        end
        puts "old_word_tests done"
      rescue
        puts "一旦飛ばします"
      end
    end

    task old_results: :environment do
      puts "old_results start"
      begin
        CSV.foreach("db-old_results.csv", headers: true) do |row|
          OldResult.find_or_create_by!({
            id: row[0],
            student_id: row[1],
            correct: row[2],
            created_at: row[3],
            updated_at: row[4],
            old_word_id: row[5],
            old_word_test_id: row[6],
          })
          puts row[0]
        end
        puts "old_results done"
      rescue
        puts "一旦飛ばします"
      end
    end

  end
end
