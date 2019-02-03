require 'test_helper'

class FossilControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get fossil_edit_url
    assert_response :success
  end

  test "should get update" do
    get fossil_update_url
    assert_response :success
  end

end
