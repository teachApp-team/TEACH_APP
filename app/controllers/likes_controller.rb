class LikesController < ApplicationController
  protect_from_forgery except: [:create, :destroy]
  def create
    @like = Like.new(
      learning_history_id: get_params[:learning_history_id],
      teacher_id: get_params[:teacher_id]
    )
    if @like.save
      render status: 200, json: { status: 200, teacher_name: @like.teacher.full_name }
    else
      render status: 200, json: { status: 200, message: 'likeの作成ができませんでした。' }
    end
  end

  def destroy
    @like =  Like.find_by(
      learning_history_id: get_params[:learning_history_id],
      teacher_id: get_params[:teacher_id] 
    )
    @like.destroy
    render status: 200, json: { status: 200, message: "正常に削除されました。" }
  end

  def get_params
    params.permit(:learning_history_id, :teacher_id)
  end
end
