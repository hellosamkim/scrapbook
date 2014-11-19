def add(x,y)
  x + y
end

def subtract(x,y)
  x - y
end

def sum(x)
  if x.empty?
    0
  else
    x.reduce(:+)
  end
end