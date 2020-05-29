class TeachersController < ApplicationController
  before_action :auth_user, except: [:new]
  def new
  end

  def show
    # @current_teacher でログインしているteacherオブジェクトを取得できる。
  end

  def edit
  end
end
