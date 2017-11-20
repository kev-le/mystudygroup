require 'test_helper'

class EnrollmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save with null fields" do
    @enrol = Enrollment.new
    assert !@enrol.save
  end

  test "should not save with negative percentage" do
    @enrol=Enrollment.new
    @enrol.percentage = -1;
    assert !@enrol.save
  end

  test "should not save with percentage >100" do
    @enrol=Enrollment.new
    @enrol.percentage = 100;
    assert !@enrol.save
  end


end
