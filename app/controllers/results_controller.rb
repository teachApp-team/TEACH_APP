class ResultsController < ApplicationController
  protect_from_forgery except: [:create]
  def create
    @result = Result.new(result_params)
    if @result.save
      render status: 200, json: { status: 200, message: 'successfully create result' }  
    else
      render status: 500, json: { status: 500, message: 'faild create result'}
    end
  end
  
  private
  def result_params
    params.permit(:student_id, :word_id, :correct, :word_test_id)
  end
end

# def publish_url
#   @space_calendar.space_organization = @space_organization
#   @space_calendar.url_published = true
#   if @space_calendar.save
#     render status: 200, json: { status: 200, message: 'Publish url successfully' }
#   else
#     render status: 500, json: { status: 500, message: 'Server Error' }
#   end
# end

# const url = '/api/v1/s/space_calendars/publish_url'
# const data = { 
#   space_id: $(this).attr('space-id'), 
#   space_organization_id: $(this).attr('space-organization-id'), 
# }
# $.ajax({
#   url: url,
#   type: 'POST',
#   data: data,
#   dataType: 'json'
# })
# .done(function(calendar) {
#   // Show here on async. When the page is reloaded it is drawn by haml
#   const destroyLink = addLink(calendar)
#   $('#google-calendar-destroy').html(destroyLink)
#   $('#google-calendar-tag').html(
#     '<div class="tag is-primary">連携中</div>'
#   )
# })
# .fail(function(calendar) {})