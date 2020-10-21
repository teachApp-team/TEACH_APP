class WordTestsController < ApplicationController
  before_action :auth_teacher, only: [:index]
  def index
    @students = @current_teacher.students
    @wordbooks = Wordbook.all
  end

  def show
    @student = Student.find(params[:id])
    @word_tests = @student.word_tests
    @wordbooks = Wordbook.all
  end

  def analysis
    @students = Student.all
    @wordbooks = Wordbook.all
    words = Word.all
    @wcr2 = []
    @wcr3 = []
    wc = {}
    words.each do |w|
      if w.wrong_count == 2
        wc.merge!('英単語' => w.english)
        wc.merge!('間違った回数' => w.wrong_count)
        wc.merge!('level' => w.level)
        @wcr2.push(wc)
        wc = {}
      end
      if w.wrong_count == 3
        wc.merge!('英単語' => w.english)
        wc.merge!('間違った回数' => w.wrong_count)
        wc.merge!('レベル' => w.level)
        @wcr3.push(wc)
        wc = {}
      end
    end
  end
end
