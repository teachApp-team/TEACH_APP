class OldResultsController < ApplicationController
  
  def create
    result = OldResult.new(result_params)
    if result.save
      render status: 200, json: { status: 200, message: 'successfully create old result' }  
    else
      render status: 500, json: { status: 500, message: "no no no"}
    end
  end
  
  private

  def result_params
    params.permit(:student_id, :old_word_test_id, :correct, :old_word_id)
  end
end
