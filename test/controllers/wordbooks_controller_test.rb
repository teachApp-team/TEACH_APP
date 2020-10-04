require 'test_helper'

class WordbooksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get wordbooks_new_url
    assert_response :success
  end

end
