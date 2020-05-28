class NewsController < ApplicationController
  def index
    @current_teacher = Teacher.find(1)
    @current_student = Student.find(1)
    histories = LearningHistory.all
    messages = Message.all
    @news = []
    histories.each do |h|
      @news.push(h)
    end
    messages.each do |m|
      @news.push(m)
    end
  end

  def test
  end
end
