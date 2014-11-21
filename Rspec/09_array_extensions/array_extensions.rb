class Array
  attr_accessor :sum

  def sum
    inject(0) do |sum, n|
      sum + n
    end
  end
end