require 'test_helper'

class WordTestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get word_tests_index_url
    assert_response :success
  end

  test "should get show" do
    get word_tests_show_url
    assert_response :success
  end

end
