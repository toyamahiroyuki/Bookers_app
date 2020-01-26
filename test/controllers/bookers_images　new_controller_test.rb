require 'test_helper'

class BookersImages　newControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get bookers_images　new_create_url
    assert_response :success
  end

  test "should get index" do
    get bookers_images　new_index_url
    assert_response :success
  end

  test "should get show" do
    get bookers_images　new_show_url
    assert_response :success
  end

end
