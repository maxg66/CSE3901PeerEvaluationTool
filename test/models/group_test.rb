require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  def setup
    @group = Group.new(g_name: "The Foodies")
  end

  test "should be valid" do
    assert @group.valid?
  end

  test "g_name should be present" do
    @group.g_name = " "
    assert_not @group.valid?
  end

  test "g_name should not be too long" do
    @group.g_name = "a" * 51
    assert_not @group.valid?
  end

  test "group names should be unique" do
    duplicate_group = @group.dup
    @group.save
    assert_not duplicate_group.valid?
  end
end
