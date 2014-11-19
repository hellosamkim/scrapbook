# TIP: Always, ALWAYS read through all of the tests before you even start writing any code.

# Again, a file with a specific name needs to be created, in this case "temperature.rb".
# $ touch temperature.rb
require "temperature.rb"

# Now maybe we can talk more about the lines we ignored last problem.
# describe is a method that takes a sting and a do-end block.
# The method is given to use by RSpec.
# The string should describe what is being tested in the do-end block.
describe "temperature conversion functions" do

  describe "#ftoc" do
    # "it" is also a method that is given to us by RSpec,
    # that also takes a string and a do-end block.
    it "converts freezing temperature" do
      # Calling the method ftoc and passing in the integer 32 should return 0.
      expect(ftoc(32)).to eq(0)
    end

    # The next three tests are similar, except different numbers are being passed in.
    it "converts boiling temperature" do
      expect(ftoc(212)).to eq(100)
    end

    it "converts body temperature" do
      expect(ftoc(98.6)).to eq(37)
    end

    it "converts arbitrary temperature" do
      expect(ftoc(68)).to eq(20)
    end

  end

  # Now this set of tests describes a different method,
  # not ftoc() anymore, but ctof().
  describe "#ctof" do

    it "converts freezing temperature" do
      expect(ctof(0)).to eq(32)
    end

    it "converts boiling temperature" do
      expect(ctof(100)).to eq(212)
    end

    it "converts arbitrary temperature" do
      expect(ctof(20)).to eq(68)
    end

  end

end

# Remember the difference between integers and floats:
# 1/2 equals 0
# but 1.0/2.0 equals 0.5
# It is important to know this difference to get these tests to pass.

# Also, you can use the following information to figure out what the equation
# is to convert between the two units, fahrenheit and celsius:
#
# 1. One degree fahrenheit is 5/9 of one degree celsius
# 2. The freezing point of water is 0 degrees celsius but 32 degrees fahrenheit