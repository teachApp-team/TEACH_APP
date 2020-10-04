# Teacher.create({
#   full_name: 'kosuke fujita',
#   subject: '英語',
#   password: 'password',
#   password_confirmation: 'password',
#   image: open("./db/icons/icon0.jpeg")
# })
# 5.times do |i|
#   Student.create({
#     full_name: "test student#{i}",
#     school_of_choice: '東京大学',
#     password: 'password',
#     password_confirmation: 'password',
#     teacher_id: 1, 
#     image: open("./db/icons/icon#{i}.jpeg")
#   })
# end
# [10].each do |i|
#   LearningHistory.create({
#     learning_time: "00:#{i}:00",
#     learning_text: "チャート式　第#{i}章",
#     comment: "今日は#{i}分学習しました。",
#     subject: "国語",
#     student_id: 1,
#     created_at: '2020/09/03 15:00:00'
#   })
# end

# 2.times do |i|
#   Message.create({
#     comment: "#{i}回目のコメントだよ。",
#     student_id: 1,
#     teacher_id: 1
#   })
# end

# 20.times do |i|
#   n = 6 % (i + 1)
#   Test.create({
#     name: "#{i}回目のテスト",
#     score: "#{i + 60}",
#     grade: i > 9 ? "A" : "B",
#     date: "2020-06-#{i + 1}",
#     student_id: n + 2,
#     teacher_id: 1,
#     average_score: 70.0
#   })
# end

# 5.times do |i|
#   Event.create({
#     title: "#{i}回目の授業",
#     description: "今日は#{i}回目の授業だよ",
#     subject: "英語",
#     start: "2020/06/#{i + 1} 15:00:00",
#     end: "2020/06/#{i + 1} 16:00:00",
#     allday: false,
#     homework: "英語長文読解週の#{i + 10}ページ",
#     teacher_id: 1,
#     student_id: 1
#   })
# end

# 5.times do |i|
#   Student.create({
#     full_name: "test student#{i + 20}",
#     school_of_choice: '東京大学',
#     password: 'password',
#     password_confirmation: 'password',
#     image: open("./db/icons/icon#{i}.jpeg")
#   })
# end

150.times do |i|
  Word.create({
    english: "basic_word#{i}",
    japanese: "基礎単語#{i}",
    part: "名詞",
    level: "基礎",
    wordbook_id: 4
  })
end
150.times do |i|
  Word.create({
    english: "standard_word#{i}",
    japanese: "標準単語#{i}",
    part: "名詞",
    level: "標準",
    wordbook_id: 4
  })
end
150.times do |i|
  Word.create({
    english: "super_word#{i}",
    japanese: "発展単語#{i}",
    part: "名詞",
    level: "発展",
    wordbook_id: 4
  })
end