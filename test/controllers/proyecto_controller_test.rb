require 'test_helper'

class ProyectoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get proyecto_index_url
    assert_response :success
  end

  test "should get new" do
    get proyecto_new_url
    assert_response :success
  end

  test "should get create" do
    get proyecto_create_url
    assert_response :success
  end

end
