class TeachersController < ApplicationController
  before_action :auth_user, except: [:new]
  def new
  end

  def show
    # @current_teacher でログインしているteacherオブジェクトを取得できる。
  end

  def edit
  end

  def update
    user = Teacher.find(@current_teacher.id)
    user.update(teacher_params)
    redirect_to "/teachers/#{@current_teacher.id}"
  end

  private
  def teacher_params
    params.require(:teacher).permit(:full_name, :subject, :image)
  end
end
