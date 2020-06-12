class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy] #パラメータのidからレコードを特定するメソッド
  before_action :auth_user

  def index
    if @current_teacher
      @events = Event.where(teacher_id: @current_teacher.id)
    else
      @events = Event.where(student_id: @current_student.id)
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to '/students/show_calender'
    else
      redirect_to '/events/new'
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    redirect_to '/students/show_calender'
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(
        :title,
        :description,
        :subject,
        :start,
        :end,
        :allday,
        :homework,
        :teacher_id,
        :student_id
      )
    end
end
