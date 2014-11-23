class Array
  attr_accessor :sum

  def sum
    inject(0) { |sum, x| sum + x }
  end

  def square
    if self.empty?
      []
    else
      self.collect { |x| x *= x }
    end
  end

  def square!
    self.collect! { |x| x *= x }
  end
end