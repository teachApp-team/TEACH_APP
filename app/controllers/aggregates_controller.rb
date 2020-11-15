class AggregatesController < ApplicationController
  protect_from_forgery except: [:create]
  def index
  end

  def update
    @student = Student.find(params[:student_id])
    @aggregate = Aggregate.find_by({
      student_id: @student.id,
      wordbook_id: params[:wordbook_id],
      level: params[:level] 
    })
    return nil if @aggregate.nil?
    if @aggregate.is_level
      @aggregate.percentage = @student.corrects_of_level_percentage(params[:level])
      @aggregate.save
    elsif @aggregate.level == '単語帳'
      @aggregate.percentage = @student.corrects_of_book_percentage(params[:wordbook_id])
      @aggregate.save
    end
    render status: 200, json: { status: 200, message: 'successfully create aggregate' }  
  end

  private
  def aggregate_params
    params.permit(:student_id, :wordbook_id, :level)
  end
end
