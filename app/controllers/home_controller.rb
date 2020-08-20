class HomeController < ApplicationController
  def top
  end

  def test_index
  end

  def student_sign_up
    @student = Student.new(params[:student])
  end
  
  def teacher_sign_up
    @teacher = Teacher.new(params[:teacher])
  end

end
