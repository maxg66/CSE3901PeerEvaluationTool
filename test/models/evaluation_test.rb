require 'test_helper'

class EvaluationTest < ActiveSupport::TestCase
  def setup
    @evaluation = Evaluation.new(student_evaluated: "Brutus Buckeye", content: "Great", rating: 9,
                  user_id: 1, project_id: 1)
  end

  test "student_evaluated should be present" do
    @evaluation.student_evaluated = " "
    assert_not @evaluation.valid?
  end

  test "student_evaluated should not be too long" do
    @evaluation.student_evaluated = "a" * 51
    assert_not @evaluation.valid?
  end

  test "content should be present" do
    @evaluation.content = " "
    assert_not @evaluation.valid?
  end

  test "rating should be within range 1-10" do
    @evaluation.rating = 11
    assert_not @evaluation.valid?
  end
end
