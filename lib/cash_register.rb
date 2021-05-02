require 'pry'

class CashRegister

    attr_reader :discount, :items
    attr_accessor :total

    def initialize(discount = -1)
        @discount = discount
        @total = 0
        @items = []
        @last = []
    end

    def add_item(title, price, quantity = 1)
        quantity.times do
            items << title
            self.total += price
            @last << {price: price, quantity: quantity}
        end
    end

    def apply_discount
        if discount > 0
            self.total -= (self.total * (discount / 100.0))

            "After the discount, the total comes to $#{self.total.to_int}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @last.last[:quantity].times do
            # binding.pry
            self.total -= @last.pop[:price]
            items.pop
        end
    end
end