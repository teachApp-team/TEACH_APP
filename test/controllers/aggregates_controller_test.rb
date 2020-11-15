require 'test_helper'

class AggregatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get aggregates_index_url
    assert_response :success
  end

end
