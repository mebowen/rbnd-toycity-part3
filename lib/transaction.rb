class Transaction
    attr_reader :id, :customer, :product
    
    @@count = 1 
    @@transactions = []
    
    def initialize(customer, product)
        @id = @@count
        @@count += 1 
        @customer = customer
        @product = product
        add_to_transactions 
    end
    
    def self.all
        @@transactions
    end
    
    private
    
    def self.find(id)
        @@transactions.find {|p| p.id == id} 
    end
        
    def add_to_transactions
        if @product.stock == 0 
            raise OutOfStockError, "#{@product.title} is out of stock."
        else
            @product.reduce_stock 
            @@transactions << self 
        end
    end
end

