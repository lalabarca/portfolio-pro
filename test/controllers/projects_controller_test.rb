require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get projects_show_url
    assert_response :success
  end
end
