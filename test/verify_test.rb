require 'test_helper'

class VerificationCalcTest < Minitest::Test

  def setup
    @calculator = Calculator.new
  end

  def test_addition
    assert_equal 5.0, @calculator.add(2.0, 3)
  end

  def test_subtraction
    assert_equal 2, @calculator.subtract(3.0, 1)
  end

  def test_multiplication
    assert_equal 4.0, @calculator.multiply(2.0, 2)
  end

  def test_division
    assert_equal 3.0, @calculator.divide(6.0, 2)
  end

  def test_division_by_zero
    assert_equal Float::INFINITY, @calculator.divide(6, 0)
  end
end
