class ApplicationController < ActionController::Base
  before_action :current_teacher
  before_action :current_student

  private

  def current_teacher
    if session[:teacher_id]
      @current_teacher = Teacher.find(session[:teacher_id])
      @current_user = Teacher.find(session[:teacher_id])
    end
  end

  def current_student
    if session[:student_id]
      @current_student = Student.find(session[:student_id])
      @current_user = Student.find(session[:student_id])
    end
  end

  def auth_user
    if @current_user == nil
      redirect_to '/'
    end
  end
end
