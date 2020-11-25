require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  def setup
    @project = Project.new(p_name: "Peer Evaluation Tool", project_type: "project", due_date: "2021-12-19")
  end

  test "should be valid" do
    assert @project.valid?
  end

  test "p_name should be present" do
    @project.p_name = " "
    assert_not @project.valid?
  end

  test "p_name should not be too long" do
    @project.p_name = "a" * 51
    assert_not @project.valid?
  end

  test "project names should be unique" do
    duplicate_project = @project.dup
    @project.save
    assert_not duplicate_project.valid?
  end

  test "project_type should be present" do
    @project.project_type = " "
    assert_not @project.valid?
  end

  test "due_date should be present" do
    @project.due_date = " "
    assert_not @project.valid?
  end

  # test "date validation should accept valid dates" do
  #   valid_dates = %w[2021-12-12 2021-1-1 2021-1-31 2021-12-31]
  #   # valid_dates = %w[2021-12-12 2021-09-12 2021-12-05 2021-12-31]
  #   valid_dates.each do |valid_date|
  #     @project.due_date = valid_date
  #     assert @project.valid?, "#{valid_date.inspect} should be valid"
  #   end
  # end

  # test "date validation should reject invalid dates" do
  #   invalid_dates = %w[02-1-1 202-1-1 2021-01-1 2021-00-1 2021-13-1 2021-12-32]
  #   # valid_dates = %w[2021-13-12 2021-09-32 2021-00-05 2021-05-00 2021-1-1]
  #   invalid_dates.each do |invalid_date|
  #     @project.due_date = invalid_date
  #     assert_not @project.valid?, "#{invalid_date.inspect} should be invalid"
  #   end
  # end
end
