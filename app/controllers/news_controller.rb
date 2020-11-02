class NewsController < ApplicationController
  before_action :auth_user
  skip_before_action :verify_authenticity_token
  include AjaxHelper 

  def index
    require "time"
    if @current_student.present?
      learning_histories = LearningHistory.where(student_id: @current_student.id)
      messages = Message.where(student_id: @current_student.id)
      @questions = Question.where(student_id: @current_student.id).order(created_at: :desc)
      @replies = Reply.where(student_id: @current_student.id).order(created_at: :desc)
      @old_word_tests = OldWordTest.where(student_id: @current_student.id)
      @word_tests = WordTest.where(student_id: @current_student.id)
    end
    if @current_teacher.present?
      learning_histories = LearningHistory.where(student_id: @current_teacher.students.ids)
      messages = Message.where(student_id: @current_teacher.id)
      @questions = Question.where(student_id: @current_teacher.id).order(created_at: :desc)
      @replies = Reply.where(student_id: @current_teacher.id).order(created_at: :desc)
      @old_word_tests = OldWordTest.where(student_id: @current_teacher.students.ids).order(created_at: :desc)
      @word_tests = WordTest.where(student_id: @current_teacher.students.ids).order(created_at: :desc)
    end

    @lm = []
    learning_histories.each {|l| @lm.push(l)}
    messages.each {|m| @lm.push(m) }
    @lm.sort_by! {|l| l.created_at }
    @lm.reverse!
    @t = []
    @old_word_tests.each {|w| @t.push(w) } if @old_word_tests.length > 0
    @word_tests.each {|w| @t.push(w) } if @word_tests.length > 0
    @t.sort_by! {|s| s[:created_at]}
    @t.reverse!
  end

  def new_learning_history
    gon.user_id = @current_student.id
    gon.teacher_subject = @current_student.teacher.subject
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

  def destroy_lh
    lh = LearningHistory.find(params[:id])
    lh.destroy
    redirect_to "/news_field"
  end

  def edit_lh
    @lh = LearningHistory.find_by(id: params[:id])
    @lh_time = @lh.learning_time
  end

  def update_lh
    lh = LearningHistory.find(params[:id])
    lh.update(lh_params)
    redirect_to "/news_field"
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

  private

  def lh_params
    params.require(:learning_history).permit(:learning_time,:learning_text,:comment)
  end
end
