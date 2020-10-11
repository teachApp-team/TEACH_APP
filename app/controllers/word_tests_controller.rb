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
end
