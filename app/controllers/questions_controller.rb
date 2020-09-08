class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    question = Question.new(question_params)
    if question.save
      redirect_to '/news_field'
    else
      redirect_to '/questions/new'
    end 
  end

  private
  def question_params
    params.require(:question).permit(:teacher_id, :student_id, :category, :image, :content)
  end
end
