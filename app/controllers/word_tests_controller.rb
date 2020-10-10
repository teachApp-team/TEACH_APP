class WordTestsController < ApplicationController
  def index
    @students = @current_teacher.students
  end

  def show
  end
end
