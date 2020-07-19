class HomeController < ApplicationController
  def top
  end

  def test_index
  end

  def student_sign_up
    @user = Student.new(params[:user])
    @user.save
    redirect_to ('/')
  end
  
  def teacher_sign_up
  end

end
