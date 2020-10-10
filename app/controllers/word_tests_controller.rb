class WordTestsController < ApplicationController
  before_action :auth_teacher, only: [:index]
  def index
    @students = @current_teacher.students
    @wordbooks = Wordbook.all
  end

  def show
  end
end
