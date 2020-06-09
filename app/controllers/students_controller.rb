class StudentsController < ApplicationController
  before_action :auth_student, except: [:new, :show_calender]
  def index
    @students = Student.all
  end

  def show
  end

  def show_test
    @student = Student.find_by(id: @current_student.id)
    @test_ary = []
    @test = Test.where(student_id: @current_student.id)
    tests = Test.all  
    tests.each_with_index do |t,i|
      @test_ary << [t.date, t.score]
    end
    
  end

  def show_calender
  end

  def new
  end

  def history
    @histories = LearningHistory.where(student_id: @current_student.id)
  end

  def edit
  end
end
