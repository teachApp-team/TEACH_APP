class NewsController < ApplicationController
  before_action :auth_user

  def index
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
