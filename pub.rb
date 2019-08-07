class Pub

  attr_reader :name
  attr_accessor :till, :drinks

  def initialize(name, drinks)
    @name = name
    @till = 0
    @drinks = drinks
  end

  def sell_drinks(customer, drink)
    if customer.age < 18
      return "Sorry, we don't serve under age"
    elsif customer.drunkenness > 200
      return "Sorry, you drank too much!!"
    else
      customer.wallet -= drink.price
      @till += drink.price
      customer.drunkenness += drink.alcohol_level
    end
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
