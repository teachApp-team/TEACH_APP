class SessionsController < ApplicationController
  def create
    teacher = Teacher.find_by(full_name: params[:session][:name])
    if teacher && teacher.authenticate(params[:session][:password])
      session[:teacher_id] = teacher.id
      redirect_to '/news_field'
    end

    student = Student.find_by(full_name: params[:session][:name])
    if student && student.authenticate(params[:session][:password])
  end

  def destroy
    session.delete(:teacher_id)
    redirect_to root_path
  end
end
