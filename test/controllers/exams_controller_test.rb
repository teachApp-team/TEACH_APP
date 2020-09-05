require 'test_helper'

class ExamsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get exams_index_url
    assert_response :success
  end

  test "should get show" do
    get exams_show_url
    assert_response :success
  end

  test "should get new" do
    get exams_new_url
    assert_response :success
  end

end
