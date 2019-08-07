class Customer

  attr_reader :name, :age
  attr_accessor :wallet, :drunkenness

  def initialize(name, money, age, drunkenness)
    @name = name
    @wallet = money
    @age = age
    @drunkenness = drunkenness
  end

  def buy_drink_from_pub(drink, pub)
    if @age < 18
      return "Sorry, we don't serve under age"
    elsif @drunkenness > 200
      return "Sorry, you drank too much!!"
    else
      @wallet -= drink.price
      pub.till += drink.price
      @drunkenness += drink.alcohol_level
    end
  end


end
