def reverser
  words = yield.split(" ")
  words.each do |word|
    word.reverse!
  end
  words.join(" ")
end

def adder(num = 1)
  yield + num
end

def repeater(x = 1)
  if x > 1
    x.times do 
      yield
    end
  else
    yield 
  end
end