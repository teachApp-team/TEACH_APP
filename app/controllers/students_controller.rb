class StudentsController < ApplicationController
  before_action :auth_student, except: [:new, :show_calender, :index, :create, :add, :unfasten]
  def index
    @students = Student.all
  end

  def new_exam
  end

  def show
    @events = Event.where(student_id: @current_student.id)
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
    history_date_ary = []
    @histories.each_with_index do |t,i|
      history_date_ary << t.created_at.strftime("%Y年%m月%d日")
    end
    @hd = history_date_ary.uniq.sort.reverse!

    @histories1 = LearningHistory.where(student_id: @current_student.id)
    @history_time_ary = []

    sum = 0
    @temp_created = @histories1[0].created_at.strftime("%Y年%m月%d日")
    @histories1.each_with_index do |h, index|
      new_created_at = h.created_at.strftime("%Y年%m月%d日")
      sum = 0 if @temp_created != new_created_at
      @temp_created = new_created_at
      new_learning_time = h.learning_time.hour*60 + h.learning_time.min
      @hd.each_with_index do |t, i|
        if t == new_created_at
          sum += new_learning_time
          @history_time_ary[i] = sum
        end
      end
    end 
    @history_time_ary.sort.reverse!
  end

  def edit
  end

  def update
    user = Student.find(@current_student.id)
    if user.update(student_params)
      redirect_to "/students/#{@current_student.id}"
    else
      redirect_to "/news_field"
    end
  end

  def add
    student = Student.find(params[:student_id])
    @current_teacher.students << student
    redirect_to students_index_path
  end

  def unfasten
    student = Student.find(params[:student_id])
    @current_teacher.students.delete(student)
    redirect_to "/teachers/#{@current_teacher.id}"
  end

  private
  def student_params
    params.require(:student).permit(:full_name, :password, :password_confirmation, :school_of_choice, :subject, :image)
  end

  def get_params
    params.permit(:student_id)
  end
end
