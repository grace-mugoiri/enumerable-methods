require "./enumerable_methods"

RSpec.describe Enumerable do
    let(:arr){["aa", "bb", "cc", "dd", "ee"]}
    let(:nums){[1,2,3,4,5]}

    describe "#my_each" do
        it "loops through each element in a given array" do
            expect(arr.my_each {|a| a}).to eql(arr)
        end
    end

    describe "#my_each_with_index" do
        it "loops through each element and returns at its index" do
            expect(nums.my_each_with_index {|n| n}).to eql(nums)
        end
    end
    
    describe "#my_all?" do
        it "returns 'true' if all elements in a given condition pass else 'false'" do
            expect(nums.my_all? {|t| t == 3}).to eql(false)
        end
    end

    describe "#my_any?" do
        it "returns 'true' if any elements in a given condition pass else 'false'" do
            expect(nums.my_any? {|t| t < 2}).to eql(true)
        end
    end

    describe "#my_none?" do
        it "returns 'true' if any elements in a given condition pass else false" do
            expect(nums.my_none? {|t| t > 10}).to eql(true)
        end
    end

    describe "#my_count?" do
        it "returns number of elements in a given array" do
            expect(arr.my_count?).to eql(5)
        end
    end

    describe "#my_map" do
        it "returns an 'updated' array with values from a given block" do
            expect(nums.my_map? {|num| num + 1}).to eql([2,3,4,5,6])
        end
    end
    
end
