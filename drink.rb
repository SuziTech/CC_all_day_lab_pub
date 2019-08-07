class Drink

  attr_reader :name, :alcohol_level
  attr_accessor :price

  def initialize(name, price, alcohol_level)
    @name = name
    @price = price
    @alcohol_level = alcohol_level
  end


end
