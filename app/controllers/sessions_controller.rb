class SessionsController < ApplicationController
  def create
    teacher = Teacher.find_by(full_name: params[:session][:name])
    if teacher && teacher.authenticate(params[:session][:password])
      session[:teacher_id] = teacher.id
    end

    student = Student.find_by(full_name: params[:session][:name])
    if student && student.authenticate(params[:session][:password])
      session[:student_id] = student.id
      redirect_to '/news_field'
    else
      redirect_to '/'
    end
  end

  def destroy
    if session[:teacher_id]
      session.delete(:teacher_id)
    elsif session[:student_id]
      session.delete(:student_id)
    end
    redirect_to root_path
  end
end
