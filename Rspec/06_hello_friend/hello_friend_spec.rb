require "friend"

describe Friend do

  it "says hello to someone" do
    friend = Friend.new
    expect(friend.greet("Bob")).to eq("Hello Bob!")
  end

  it "says hello to no one" do
    # Hint: remember default values?
    #
    # def greet(name = ?)
    #   # your code here
    # end
    #
    # What should ? be equal to?
    friend = Friend.new
    expect(friend.greet).to eq("Hello !")
  end
end
