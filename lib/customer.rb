class Customer  
    attr_reader :name
    
    @@customers = [] 
    
    def initialize(options={})
        @name = options[:name]
        add_to_customers
    end
    
    def self.all
        @@customers
    end
    
    def purchase(product)
        Transaction.new(self, product)
    end
    
    def self.list
        @@customers.sort_by(&:name)
    end
    
    private
    
    def self.find_by_name(name)
        @@customers.find {|p| p.name == name} 
    end
    
    def add_to_customers
        customer = self.class.find_by_name(@name)
        if customer 
            raise DuplicateCustomerError, "'#{name}' already exists."
        else 
            @@customers << self 
        end
    end
end
