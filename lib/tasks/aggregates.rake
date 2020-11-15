namespace :aggregates do
  task exec: :environment do
    Student.all.each do |student|
      puts student.full_name
      Wordbook.all.each do |wordbook|
        puts wordbook.name
        next if wordbook.levels.blank?
        Aggregate.create!({
          student_id: student.id,
          wordbook_id: wordbook.id,
          is_level: false,
          percentage: student.corrects_of_book_percentage(wordbook.id),
          level: "単語帳" 
        })
        wordbook.levels.each do |level|
          puts level
          puts student.corrects_of_level_percentage(level)
          Aggregate.create!({
            student_id: student.id,
            wordbook_id: wordbook.id,
            is_level: true,
            percentage: student.corrects_of_level_percentage(level),
            level: level 
          })
        end
      end
      puts "------------------------------"
    end
  end
end