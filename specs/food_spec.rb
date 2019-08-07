require('minitest/autorun')
require('minitest/rg')
require_relative('../food.rb')


class TestFood < Minitest::Test

  def setup()
    @food = Food.new("Pasta", 8.50, 100)
  end

  def test_food_name()
    assert_equal("Pasta", @food.name)
  end

end
