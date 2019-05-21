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

    def my_map?
        res = []
        self.my_each do |ex|
        end
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

arr = ['cat ', 'dog ', 'pig ', 'goat ', "hen "]
nums = [1, 2, 3, 4, 5]
ints = [2, 4, 6, 8, 9]

# test for my_each function
arr.my_each do |a|
    puts "#{a}"
end

# # # # test for my_each_with_index function
arr.my_each_with_index do |animal, idx|
    puts animal if idx % 2 == 0
 end

# # #  test for my_select function
nums.my_select do |ex|
    puts "#{ex}" 
end

# # test if all return true or false
puts arr.my_all? { |ex| ex == 'dog' }

# # test if any return true or false
puts arr.my_any? { |ex| ex == 'cat' }

# # # test if none return true or false
puts arr.my_none? {|ex| ex =='dog'}

# # # test if count returns number of items in an array
puts ints.my_count?

# # # test map
puts nums.my_map? { |n| n.even? }

# # test my_inject
puts nums.my_inject?(1) { |result, element| result + element }

# test multiply_els







