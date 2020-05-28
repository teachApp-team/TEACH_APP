Teacher.create({
  full_name: 'kosuke fujita',
  subject: '英語',
  password: 'password',
  password_confirmation: 'password',
  image: open("./db/icons/icon0.jpeg")
})
Student.create({
  full_name: 'hiroharu hara',
  school_of_choice: '東京大学',
  password: 'password',
  password_confirmation: 'password',
  teacher_id: 1,
  image: open("./db/icons/icon1.png")
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
  Message.create({
    comment: "#{i}回目のコメントだよ。",
    student_id: 1,
    teacher_id: 1
  })
end