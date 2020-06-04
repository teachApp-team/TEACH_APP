class StudentsController < ApplicationController
  before_action :auth_student, except: [:new]
  def index
    @students = Student.all
  end

  def show
  end

  def show_test
    @test_ary = []
    tests = Test.all
    tests.each_with_index do |t,i|
      @test_ary << [t.date, t.score]
    end
    
  end

  def new
  end

  def history
    @histories = LearningHistory.where(student_id: @current_student.id)
  end

  def edit
  end
end
