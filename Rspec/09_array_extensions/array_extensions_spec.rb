require "array_extensions" # we don't call it "array.rb" since that would be confusing

describe Array do

  describe '#sum' do
    # it "has a #sum method" do
    #   [].to respond_to(:sum)
    #   Array.to respond_to(:sum)
      # [] and Array are synonymous
      #
      # Whoa! Hold on! We're expected to add a method
      # to a class that already exists inside of Ruby?
      # Well, yes. And the way you can do that is quite easy:
      #
      # class Array
      #   def hello
      #     return "Hello!"
      #   end
      # end
      #
      # [].hello => "Hello!"
    # end

    it "should be 0 for an empty array" do
      expect([].sum).to eq(0)
    end

    it "should add all of the elements" do
      expect([1,2,4].sum).to eq(7)
    end
  end

  describe '#square' do
    it "does nothing to an empty array" do
      expect([].square).to eq([])
    end

    it "returns a new array containing the squares of each element" do
      expect([1,2,3].square).to eq([1,4,9])
    end
  end

  describe '#square!' do
    it "squares each element of the original array" do
      array = [1,2,3]
      array.square!
      expect(array).to eq([1,4,9])
    end
  end

end
