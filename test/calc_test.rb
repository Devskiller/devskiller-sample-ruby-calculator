require 'test_helper'

class CalcTest < Minitest::Test
  def setup
    @calculator = Calculator.new
  end

  def test_addition
    assert_equal 5, @calculator.add(2, 3)
  end

  def test_subtraction
    assert_equal 2, @calculator.subtract(3, 1)
  end

  def test_multiplication
    assert_equal 4, @calculator.multiply(2, 2)
  end

  def test_division
    assert_equal 2, @calculator.divide(6, 3)
  end
end
