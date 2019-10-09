require 'test_helper'

class Api::V1::ProgramsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_programs_index_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_programs_create_url
    assert_response :success
  end

  test "should get delete" do
    get api_v1_programs_delete_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_programs_show_url
    assert_response :success
  end

end
