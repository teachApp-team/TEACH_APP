class HomeController < ApplicationController
  def show
  end

  def ranking
    @wordbook = Wordbook.find(params['id']).name
  end


  def words
    wordbook = Wordbook.find(params['id'])
    @words = wordbook.words
  end

  def level
    @levels = Wordbook.find(params['id']).levels
    @wordbook = Wordbook.find(params['id'])
  end

  def japaneselevel
    @wordbook = OldWordbook.first
    @testwords = []
  end

  def test
    @wordtest = WordTest.create(student_id: @current_student.id)
    @wordbook = Wordbook.find(params['wordbook_id'])
    @words = @wordbook.leveling_words(params['level'], params['limit'])
    @testwords = @wordbook.testabe_words(params['level'], params['limit'])
    gon.words = @testwords
  end

  def japanesetest
    @wordbook = OldWordbook.first
    @testwords = []
    @words = @wordbook.test_words(10)
    @wordtest = OldWordTest.new(student_id: @current_student.id)
  end



  def retest
    @wordtest = WordTest.create(student_id: @current_student.id)
    @wordbook = Wordbook.find(params['wordbook_id'])
    @words = @wordbook.leveling_words(params['level'], 10)
    @testwords = @wordbook.retestabe_words(params['level'], 10, params['wrong_count'])
    gon.words = @testwords
    # retestabe_words(level, limit, count)
    render "test"
  end

  def choise_retest
    @wordbook = Wordbook.find(params['wordbook_id'])
    @level = params['level']
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
