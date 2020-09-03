class TeachersController < ApplicationController
  before_action :auth_teacher, except: [:new, :create]
  def new
  end

  def create
    teacher = Teacher.new(teacher_params)
    if teacher.save
      redirect_to("/")
    else
      redirect_to :back
    end
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

  def delete_test
    test = Test.find(params[:id])
    test.destroy
    redirect_to '/teachers/show_test'
  end

  def edit_test
    @students = Student.where(teacher_id: @current_teacher.id)
  end

  def ajax_create_test
    @test = Test.new(test_params)
    if @test.save
      @students = Student.where(teacher_id: @current_teacher.id)
      redirect_to '/teachers/show_test'
    else
      redirect_to '/teachers/show_test'
    end
  end

  def each_student
    @events = Event.where(student_id: params[:id])
    @student = Student.find(params[:id])
  end


  def edit
  end

  def update
    user = Teacher.find(@current_teacher.id)
    if user.update(teacher_params)
      redirect_to "/teachers/#{@current_teacher.id}"
    else
      redirect_to "/news_field"
    end
  end

  def show_calender
    @events = Event.where(student_id: @current_teacher.id)
    @students = @current_teacher.students
    @student = Student.find(params[:id])
  end

  private
  def teacher_params
    params.require(:teacher).permit(:full_name, :password, :password_confirmation, :subject, :image)
  end

  def test_params
    params.require(:test).permit(
      :student_id,
      :teacher_id,
      :name,
      :score,
      :grade,
      :date,
      :average_score
    )
  end
end
