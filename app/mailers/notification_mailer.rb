class NotificationMailer < ApplicationMailer
  default from: "hogehoge@example.com"

  def send_test(message)
    @message = message
    mail(
      subject: "これはテスト用のメールです。", #メールのタイトル
      to: 'hh.25799623@gmail.com' #宛先
    ) do |format|
      format.html
    end
  end

  def send_message(message)
    @message = message
    mail(
      subject: "#{@message.teacher.full_name}先生から新着メッセージがあります", #メールのタイトル
      to: @message.student.mail,
      # to: 'hh.25799623@gmail.com',
      from: '"no-reply@teachapp.com" <no-reply@teachapp.com>'
    ) do |format|
      format.html
    end
  end

  def send_reply(reply)
    @reply = reply
    mail(
      subject: "#{@reply.teacher.full_name}先生から新着メッセージがあります", #メールのタイトル
      to: @reply.student.mail,
      # to: 'hh.25799623@gmail.com',
      from: '"no-reply@teachapp.com" <no-reply@teachapp.com>'
    ) do |format|
      format.html
    end
  end
end
