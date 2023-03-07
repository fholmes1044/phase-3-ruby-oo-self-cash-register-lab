class CashRegister
    attr_accessor :discount, :total, :items, :last_transaction

    def initialize(discount=0)
        @discount = discount
        @total = 0
        @items = []
    end

    def add_item(title, price, quantity=1) 
        self.total += price * quantity
        self.last_transaction = price * quantity
        if quantity > 1 
            quantity.times do |i|
                self.items << title 
            end
        else self.items << title
        end
        
    end
    
    def apply_discount
        if self.discount > 1
            self.total = self.total - self.total * self.discount/100  
            "After the discount, the total comes to $#{self.total}."
        elsif self.discount < 1 
            "There is no discount to apply."
        end 
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end 
end 
