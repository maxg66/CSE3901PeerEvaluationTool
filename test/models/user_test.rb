require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(u_name: "Example User", email: "buckeye.1@osu.edu", password: "osu12345")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "u_name should be present" do
    @user.u_name = " "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "u_name should not be too long" do
    @user.u_name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 248 + "@osu.edu"
    assert_not @user.valid?
  end

  test "email addresses should be saved as lowercase" do
    mixed_case_email = "BUCKS.1@OsU.EdU"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[bucks.1@osu.edu BUCKS.1@osu.edu bucks.1@osu.EDU buckeye.123@OSU.edu]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[buckeye.1@example,edu buckeye-1@osu.edu buckeye1@osu.edu buckeye.1@osu-eng.edu]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = " " * 8
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = "a" * 7
    assert_not @user.valid?
  end

  # test "password should be present (nonblank)" do
  #   @user.password = @user.password_confirmation = " " * 8
  #   assert_not @user.valid?
  # end

  # test "password should have a minimum length" do
  #   @user.password = @user.password_confirmation = "a" * 7
  #   assert_not @user.valid?
  # end
end
