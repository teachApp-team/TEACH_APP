class MessagesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.teacher = @current_teacher
    if @message.save
      redirect_to '/news_field'
    else
      redirect_to '/messages/new'
    end
  end

  def edit
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_to '/news_field'
  end

  private
  def message_params
    params.require(:message).permit(:comment, :student_id)
  end

end
