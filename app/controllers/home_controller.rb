class HomeController < ApplicationController
  def show
  end

  def level
    @levels = Wordbook.find(params['id']).levels
    @wordbook = Wordbook.find(params['id'])
  end

  def test
    @wordbook = Wordbook.find(params['wordbook_id'])
    @words = @wordbook.leveling_words(params['level'], params['limit'])
    gon.words = @wordbook.testabe_words(params['level'], params['limit'])
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
