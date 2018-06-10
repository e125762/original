require 'test_helper'

class GroupsUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get groups_users_create_url
    assert_response :success
  end

  test "should get destroy" do
    get groups_users_destroy_url
    assert_response :success
  end

end
