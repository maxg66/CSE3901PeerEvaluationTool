require 'test_helper'

class UserStaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get loginPage" do
    get root_url
    assert_response :success
    assert_select "title", "Login | Peer Evaluation Tool"
  end

  test "should get projectPage" do
    get user_static_pages_projectPage_url
    assert_response :success
    assert_select "title", "Projects | Peer Evaluation Tool"
  end

  test "should get groupPage" do
    get user_static_pages_groupPage_url
    assert_response :success
    assert_select "title", "Group | Peer Evaluation Tool"
  end

  test "should get ratingPage" do
    get user_static_pages_ratingPage_url
    assert_response :success
    assert_select "title", "Ratings | Peer Evaluation Tool"
  end

end
