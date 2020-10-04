class HomeController < ApplicationController
  def show
  end

  def level
  end

  def test
  end

  def top
    if @current_user
      redirect_to '/news_field'
    end
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
