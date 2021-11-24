require 'test_helper'

class EditorialsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get editorials_index_url
    assert_response :success
  end

  test "should get new" do
    get editorials_new_url
    assert_response :success
  end

  test "should get edit" do
    get editorials_edit_url
    assert_response :success
  end

  test "should get create" do
    get editorials_create_url
    assert_response :success
  end

  test "should get update" do
    get editorials_update_url
    assert_response :success
  end

  test "should get destroy" do
    get editorials_destroy_url
    assert_response :success
  end

end
