class NewsController < ApplicationController
  before_action :auth_user
  skip_before_action :verify_authenticity_token
  include AjaxHelper 

  def index
    require "time"
    if @current_student.present?
      histories = LearningHistory.where(student_id: @current_student.id)
      messages = Message.where(student_id: @current_student.id)
      questions = Question.where(student_id: @current_student.id)
      replies = Reply.where(student_id: @current_student.id)
      eachjtests = OldWordTest.where(student_id: @current_student.id)
      eachtests = WordTest.where(student_id: @current_student.id)
    end
    if @current_teacher.present?
      histories = LearningHistory.where(student_id: @current_teacher.students.ids)
      messages = Message.where(teacher_id: @current_teacher.id)
      questions = Question.where(teacher_id: @current_teacher.id)
      replies = Reply.where(student_id: @current_teacher.id)
      eachjtests = OldWordTest.where(student_id: @current_teacher.students.ids) 
      eachtests = WordTest.where(student_id: @current_teacher.students.ids) 
    end
    @news = []
    questions.each do |q|
      @news.push(q)
    end
    histories.each do |h|
      @news.push(h)
    end
    messages.each do |m|
      @news.push(m)
    end
    eachtests.each_with_index do |et, ei|
      test = {
        results: et.results,
        class: {
          name: "WordTest"
        },
        created_at: et.created_at,
        index: ei
      }
      if test[:results].length > 5
        @news.push(test)
      end
    end
    eachjtests.each_with_index do |jt, ji|
      test = {
        results: jt.old_results,
        class: {
          name: "OldWordTest"
        },
        created_at: jt.created_at,
        index: ji
      }
      if test[:results].length > 5
        @news.push(test)
      end
    end
    
    # newsの投稿日時から降順に並び替え
    @news = @news.sort_by! do |n|
      if n.class.name == "Question" && n.replies.present?
        n.replies.last.created_at 
      else
        n[:created_at]
      end 
    end
    @news.reverse!
    @news = Kaminari.paginate_array(@news).page(params[:page]).per(25)
    @n = @news.length
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
