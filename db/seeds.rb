Teacher.create({
  full_name: 'kosuke fujita',
  subject: '英語'
})
Student.create({
  full_name: 'hiroharu hara',
  school_of_choice: '東京大学',
  teacher_id: 1
})
[10, 20, 30].each do |i|
  LearningHistory.create({
    learning_time: "00:#{i}:00",
    learning_text: "チャート式　第#{i}章",
    comment: "今日は#{i}分学習しました。",
    subject: "数学",
    student_id: 1
  })
end

2.times do |i|
  Messages.create({
    comment: "#{i}回目のコメントだよ。",
    student_id: 1,
    teacher_id: 1
  })
end