class ApplicationController < ActionController::Base
  before_action :current_teacher
  before_action :current_student
  protect_from_forgery with: :null_session

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
  def auth_teacher
    if @current_teacher == nil
      redirect_to '/'
    end
  end
  def auth_student
    if @current_student == nil
      redirect_to '/'
    end
  end
end
