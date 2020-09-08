class RepliesController < ApplicationController
  before_action :set_question, only: [:new]

  def new
    @reply = Reply.new(question_id: @question)
  end

  def create
    @reply = Reply.new(reply_params)
    if @reply.save
      redirect_to "/news_field"
    else
      redirect_to "/replies/#{@reply.question.id}/new"
    end
  end

  private
  def set_question
    @question = Question.find(params[:question_id])
  end

  def reply_params
    params.require(:reply).permit(:teacher_id, :student_id, :content, :question_id, :which)
  end
end
