class TeachersController < ApplicationController
  before_action :auth_teacher, except: [:new]
  def new
  end

  def show
    # @current_teacher でログインしているteacherオブジェクトを取得できる。
  end

  def history
    @students = Student.where(teacher_id: @current_teacher.id)
  end

  def show_test
    @students = Student.where(teacher_id: @current_teacher.id)
    @test_ary = []
    # @test = Test.where(student_id: @current_teacher.id)
    tests = Test.all  
    tests.each_with_index do |t,i|
      @test_ary << [t.date, t.score]
    end
  end

  def edit_test
    @students = Student.where(teacher_id: @current_teacher.id)
  end

  def ajax_create_test
    @test = Test.new({
      name: params[:name],
      score: params[:score],
      grade: params[:grade],
      date: params[:date],
      student_id: params[:student_id],
      teacher_id: params[:teacher_id],
      average_score: params[:average_score]
    })
    @test.save
  end


  def edit
  end

  def update
    user = Teacher.find(@current_teacher.id)
    user.update(teacher_params)
    redirect_to "/teachers/#{@current_teacher.id}"
  end

  def show_calender
    @events = Event.where(student_id: params[:id])
    @students = @current_teacher.students
    @student = Student.find(params[:id])
    gon.user_id = @student.id
  end

  private
  def teacher_params
    params.require(:teacher).permit(:full_name, :subject, :image)
  end
end
