require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

class Alarm
  def initialize(year, month, day, hour, minute, second)
    @time = Time.new(year, month, day, hour, minute, second)
  end

  def time
    @time
  end

  def time2
    @time2
  end


end


# puts clock = Alarm.new(2014, 07, 16, 10, 26, 0)


# puts clock.time
# puts clock.time2


