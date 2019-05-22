module Enumerable
    def my_each
        for ani in self do
            yield(ani)
        end
        self
    end

    def my_each_with_index &block
        i = 0
        for element in self
            yield element,i
            i+=1
        end
    end

    def my_select
        for ex in self do
            yield(ex)
        end
        self
    end

    def my_all? 
        self.my_each do |ex|
            return false if yield(ex) == false
        end
        return true
    end

    def my_any?
        self.my_each do |ex|
            return true if yield(ex) == true
        end
        return false
    end

    def my_none?
        self.my_each do |ex|
            return false if yield(ex) == true
        end
        true
    end

    def my_count?
        count = 0
        if !block_given?
        self.my_each {|ex| count += 1}
        return count
        else
        self.my_each {|ex| count += 1  if yield(ex)}
        return count
        end
    end

    def my_map?(&proc)
        res = []
        self.my_each {|ex| res << yield(ex)}
        res
    end

    def my_inject?(accumulator, &block)
        each do |element|
            accumulator = block.call(accumulator, element)
        end
        accumulator
    end

    def multiply_els
        self.my_inject(1){|a,b| a+b}
    end

end








