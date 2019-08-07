class Food

  attr_reader :name, :rejuvenation_level
  attr_accessor :price

  def initialize(name, price, rejuvenation_level)
    @name = name
    @price = price
    @rejuvenation_level = rejuvenation_level
  end


end
