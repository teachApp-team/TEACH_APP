class StudentsController < ApplicationController
  before_action :auth_student, except: [:new, :show_calender, :index, :create, :add]
  def index
    @students = Student.all
  end

  def show
  end

  def show_test
    @student = Student.find_by(id: @current_student.id)
    @test_ary = []
    @test = Test.where(student_id: @current_student.id)
    tests = @test.all  
    tests.each_with_index do |t,i|
      @test_ary << [t.date, t.score]
    end   
  end

  def show_calender
    @events = Event.where(student_id: @current_student.id)
    gon.user_id = @current_student.id
  end

  def new
  end

  def create
    student = Student.new(student_params)
    if student.save
      redirect_to("/")
    else
      redirect_to :back
    end
  end


  def history
    @histories = LearningHistory.where(student_id: @current_student.id)
  end

  def edit
  end

  def update
    user = Student.find(@current_student.id)
    user.update(student_params)
    redirect_to "/students/#{@current_student.id}"
  end

  def add
    student = Student.find(params[:student_id])
    @current_teacher.students << student
    redirect_to students_index_path
  end

  private
  def student_params
    params.require(:student).permit(:full_name, :password, :password_confirmation, :school_of_choice, :teacher_id)
  end

  def get_params
    params.permit(:student_id)
  end
end
