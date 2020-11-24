require 'test_helper'

class AdminStaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get loginPage" do
    get root_url
    assert_response :success
    assert_select "title", "Login | Peer Evaluation Tool"
  end

  test "should get projectPage" do
    get admin_static_pages_projectPage_url
    assert_response :success
    assert_select "title", "Projects | Peer Evaluation Tool"
  end

  test "should get groupPage" do
    get admin_static_pages_groupPage_url
    assert_response :success
    assert_select "title", "Group | Peer Evaluation Tool"
  end

  test "should get groupMemberPage" do
    get admin_static_pages_groupMemberPage_url
    assert_response :success
    assert_select "title", "Group Members | Peer Evaluation Tool"
  end

  test "should get ratingPage" do
    get admin_static_pages_ratingPage_url
    assert_response :success
    assert_select "title", "Ratings | Peer Evaluation Tool"
  end

  test "should get studentPage" do
    get admin_static_pages_studentPage_url
    assert_response :success
    assert_select "title", "Students | Peer Evaluation Tool"
  end

end