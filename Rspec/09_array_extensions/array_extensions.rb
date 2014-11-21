class Array
  attr_accessor :sum

  def sum
    # todo: bug fix (Getting undefined method 'sum')
    inject(0) do |sum, n|
      sum + n
    end
  end
end