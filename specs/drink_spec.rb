require('minitest/autorun')
require('minitest/rg')
require_relative('../drink.rb')


class TestDrink < Minitest::Test

  def setup()
    @drink0 = Drink.new("Whiskey", 3.50)
  end

  def test_drink_name()
    assert_equal("Whiskey", @drink.name)
  end

end
