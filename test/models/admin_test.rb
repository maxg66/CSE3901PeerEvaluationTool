require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  def setup
    @admin = Admin.new(a_name: "Example Admin", a_email: "admin.1@osu.edu", a_password: "osu12345")
  end

  test "should be valid" do
    assert @admin.valid?
  end

  test "a_name should be present" do
    @admin.a_name = " "
    assert_not @admin.valid?
  end

  test "a_email should be present" do
    @admin.a_email = " "
    assert_not @admin.valid?
  end

  test "a_name should not be too long" do
    @admin.a_name = "a" * 51
    assert_not @admin.valid?
  end

  test "a_email should not be too long" do
    @admin.a_email = "a" * 248 + "@osu.edu"
    assert_not @admin.valid?
  end

  test "a_email addresses should be saved as lowercase" do
    mixed_case_email = "BUCKS.1@OsU.EdU"
    @admin.a_email = mixed_case_email
    @admin.save
    assert_equal mixed_case_email.downcase, @admin.reload.a_email
  end

  test "a_email validation should accept valid addresses" do
    valid_addresses = %w[bucks.1@osu.edu BUCKS.1@osu.edu bucks.1@osu.EDU buckeye.123@OSU.edu]
    valid_addresses.each do |valid_address|
      @admin.a_email = valid_address
      assert @admin.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "a_email validation should reject invalid addresses" do
    invalid_addresses = %w[buckeye.1@example,edu buckeye-1@osu.edu buckeye1@osu.edu buckeye.1@osu-eng.edu]
    invalid_addresses.each do |invalid_address|
      @admin.a_email = invalid_address
      assert_not @admin.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "a_email addresses should be unique" do
    duplicate_admin = @admin.dup
    @admin.save
    assert_not duplicate_admin.valid?
  end

  test "a_password should be present (nonblank)" do
    @admin.a_password = " " * 8
    assert_not @admin.valid?
  end

  test "a_password should have a minimum length" do
    @admin.a_password = "a" * 7
    assert_not @admin.valid?
  end

  # test "password should be present (nonblank)" do
  #   @admin.password = @admin.password_confirmation = " " * 8
  #   assert_not @admin.valid?
  # end

  # test "password should have a minimum length" do
  #   @admin.password = @admin.password_confirmation = "a" * 7
  #   assert_not @admin.valid?
  # end
end
