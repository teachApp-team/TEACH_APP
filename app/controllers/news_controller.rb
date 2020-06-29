class NewsController < ApplicationController
  before_action :auth_user
  skip_before_action :verify_authenticity_token
  include AjaxHelper 

  def index
    require "time"
    histories = LearningHistory.all
    messages = Message.all
    @news = []
    histories.each do |h|
      @news.push(h)
    end
    messages.each do |m|
      @news.push(m)
    end
    # newsの投稿日時から降順に並び替え
    @news.sort_by! { |n| n[:created_at] }.reverse!
  end

  def new_learning_history
  end

  def new_msg
    @message = Message.new
  end

  def create_learning_history
    # @learn = LearningHistory.new({
    #   learning_time: params[:learning][:learning_time],
    #   learning_text: params[:learning][:learning_text],
    #   comment: params[:learning][:comment],
    #   subject: params[:learning][:subject],
    #   student_id: params[:learning][:student_id]
    # })
    @learn = LearningHistory.new({
      learning_time: params[:learning_time],
      learning_text: params[:learning_text],
      comment: params[:comment],
      subject: params[:subject],
      student_id: params[:student_id]
    })
    if @learn.save
      redirect_to '/news_field'
    else
      redirect_to '/test'
    end
  end
  
  def ajax_create_learning_history
    @learn = LearningHistory.new({
      learning_time: params[:learning_time],
      learning_text: params[:learning_text],
      comment: params[:comment],
      subject: params[:subject],
      student_id: params[:student_id]
    })
    @learn.save
  end

  def create_message
    @message = Message.new({
      comment: params[:message][:comment],
      teacher_id: params[:message][:teacher_id],
      student_id: params[:message][:student_id],
    })
    if @message.save
      redirect_to '/news_field'
    else
      redirect_to '/test'
    end
  end

  def test
  end
end
