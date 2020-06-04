class StudentsController < ApplicationController
  before_action :auth_student, except: [:new]
  def index
    @students = Student.all
  end

  def show
  end

  def show_test
    @tests = Test.all
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
