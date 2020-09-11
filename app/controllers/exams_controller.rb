class ExamsController < ApplicationController
  def index
  end

  def show
  end

  def new
    teacher = @current_teacher if @current_teacher.present?
    student = @current_student if @current_student.present?
    @exam = Exam.new
    @exam.exam_subjects.build
  end

  def create
    exam = Exam.new(exam_params)
    if exam.save
      redirect_to "/news_field"
    else
      redirect_to "/"
    end
  end

  private

  def exam_params
    params.require(:exam).permit(:name, :subject, :score, :deviation, :judge, :teacher_id, :student_id, exam_subjects_attributes: [:name, :score, :deviation, :judge])
  end
end
