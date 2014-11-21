class Timer
  attr_accessor :seconds, :time_string

  def initialize(seconds = 0)
    @seconds = seconds
  end

  def time_string
    Time.at(@seconds).gmtime.strftime("%R:%S")
  end
end