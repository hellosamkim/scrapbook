# In this problem we are going to make a calculator.

# Remember to create the file!
require "calculator.rb"

# #add takes two parameters and adds them
describe "add" do

  it "adds 0 and 0" do
    expect(add(0,0)).to eq(0)
  end

  it "adds 2 and 2" do
    expect(add(2,2)).to eq(4)
  end

  it "adds positive numbers" do
    expect(add(2,6)).to eq(8)
  end
end

# #subtract takes two parameters and subtracts the second from the first
describe "subtract" do

  it "subtracts numbers" do
    expect(subtract(10,4)).to eq(6)
  end
end

# #sum takes an *array* of numbers and adds them all together
# This one is a bit trickier!
describe "sum" do

  it "computes the sum of an empty array" do
    expect(sum([])).to eq(0)
  end

  it "computes the sum of an array of one number" do
    expect(sum([7])).to eq(7)
  end

  it "computes the sum of an array of two numbers" do
    expect(sum([7,11])).to eq(18)
  end

  it "computes the sum of an array of many numbers" do
    expect(sum([1,3,5,7,9])).to eq(25)
  end
end

# Extra Credit:
# If you feel you're up for the challenge, fill in the missing code in the tests below,
# based off the descriptions, and get them to pass.

describe "#multiply" do

  it "multiplies two numbers" do
  end

  it "multiplies several numbers" do
  end

end

# http://en.wikipedia.org/wiki/Factorial
describe "#factorial" do

  it "computes the factorial of 0" do
  end

  it "computes the factorial of 1" do
  end

  it "computes the factorial of 2" do
  end

  it "computes the factorial of 5" do
  end

  it "computes the factorial of 10" do
  end
end
