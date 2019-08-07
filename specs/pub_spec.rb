require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../food.rb')
require_relative('../customer.rb')


class TestPub < Minitest::Test

  def setup
    @customer1 = Customer.new("Marcel", 100.00, 17, 0)
    @customer = Customer.new("Susan", 45.50, 21, 50)
    @food = Food.new("Pasta", 8.50, 100)
    @drink0 = Drink.new("Whiskey", 3.50, 70)
    @drink1 = Drink.new("Orange Juice", 2.00, 0)
    @drink2 = Drink.new("Red Wine", 9.99, 15)
    @pub = Pub.new("The Anchor", {
      @drink0 => 5000,
      @drink1 => 50,
      @drink2 => 100
      })
  end

  def test_pub_name()
    assert_equal("The Anchor", @pub.name)
  end

  def test_sell_drinks
    @pub.sell_drinks(@customer, @drink1)
    assert_equal(43.50, @customer.wallet)
    assert_equal(2.00, @pub.till)
  end

  def test_underage_customer
    actual = @customer1.buy_drink_from_pub(@drink2, @pub)
    assert_equal("Sorry, we don't serve under age", actual)
  end

  def test_sell_food
    @pub.sell_food(@customer, @food)
    assert_equal(37.00, @customer.wallet)
    assert_equal(8.50, @pub.till)
    assert_equal(0, @customer.drunkenness)
  end

  def test_drinks_stock_count
    stock = @pub.stock_count
    assert_equal(5150, stock)
  end

end
