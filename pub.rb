class Pub

  attr_reader :name
  attr_accessor :till, :drinks

  def initialize(name, drinks)
    @name = name
    @till = 0
    @drinks = drinks
  end

  def sell_food(customer, food)
    customer.wallet -= food.price
    @till += food.price
    if customer.drunkenness < food.rejuvenation_level
      customer.drunkenness = 0
    else
      customer.drunkenness -= food.rejuvenation_level
    end
  end

  def stock_count()
    sum = 0
    @drinks.each{ |drink, stock|  sum += stock}
    return sum
  end

end
