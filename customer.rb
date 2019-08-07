class Customer

  attr_reader :name, :age
  attr_accessor :wallet

  def initialize(name, money, age)
    @name = name
    @wallet = money
    @age = age
  end

  def buy_drink_from_pub(drink, pub)
    if @age < 18
      return "Sorry, we don't serve under age"
    else
      @wallet -= drink.price
      pub.till += drink.price
    end
  end


end
