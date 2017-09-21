require 'pry'

class CashRegister
  attr_accessor :total, :discount, :items, :prices

  def initialize(discount=nil)
    @total = 0
    @discount = discount
    @items = []
    @prices = []
  end

  def add_item(title, price, quantity=nil)
    if quantity != nil
      self.total += (price * quantity)
      quantity.times do
        @items << title
      end
    else
      self.total += price
      @items << title
      @prices << price
    end
  end

  def apply_discount
    return "There is no discount to apply." if @discount == nil
    @total = @total * (1 - (@discount * 0.01))
    return "After the discount, the total comes to $#{@total.to_i}."
  end

  def void_last_transaction
    @total -= @prices[-1]
  end
end
