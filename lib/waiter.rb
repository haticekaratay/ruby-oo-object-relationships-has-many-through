require 'pry'
class Waiter
    
    attr_accessor :name, :experience

    @@all = []
    def initialize(name,experience)
        @name = name
        @experience = experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer,total,tip)
        Meal.new(self,customer, total, tip)
    end

    def meals
        Meal.all.select{|meal| meal.waiter == self}
    end

    def best_tipper
        max_tip = 0
        best_tipper = nil
        meals.each do |meal|
            current_tip = meal.tip 
            if current_tip > max_tip
                max_tip = current_tip
                best_tipper = meal.customer
            end
        end
        best_tipper
        #binding.pry
    end
end