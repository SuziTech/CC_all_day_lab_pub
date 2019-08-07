require('minitest/autorun')
require('minitest/rg')
require_relative('../customer.rb')
require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../food.rb')

class TestCustomer < Minitest::Test

  def setup()
    @drunk_customer = Customer.new("ALF", 60, 25)
    @customer = Customer.new("Susan", 45.50, 21)
    @customer1 = Customer.new("Marcel", 100.00, 17)
    @drink0 = Drink.new("Whiskey", 3.50, 70)
    @drink1 = Drink.new("Orange Juice", 2.00, 0)
    @drink2 = Drink.new("Red Wine", 9.99, 15)
    @pub = Pub.new("The Anchor", [@drink0, @drink1, @drink2])
    @food = Food.new("Pasta", 8.50, 100)
  end

  def test_customer_name()
    assert_equal("Susan", @customer.name)
  end

  def test_buy_drink_from_pub
    @customer.buy_drink_from_pub(@drink0, @pub)
    assert_equal(42.00, @customer.wallet)
    assert_equal(3.50, @pub.till)
  end

  def test_underage_customer
    actual = @customer1.buy_drink_from_pub(@drink2, @pub)
    assert_equal("Sorry, we don't serve under age", actual)
  end

  def test_drunkenness_increase
    @customer.buy_drink_from_pub(@drink0, @pub)
    assert_equal(70, @customer.drunkenness())
  end

  def test_drunkenness_level_over_limit
    @customer.buy_drink_from_pub(@drink0, @pub)
    @customer.buy_drink_from_pub(@drink0, @pub)
    @customer.buy_drink_from_pub(@drink0, @pub)

    assert_equal("Sorry, you drank too much!!", @customer.buy_drink_from_pub(@drink0, @pub))

  end

  

end
