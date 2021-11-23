require 'date'

class Calendar

  attr_reader :days

  def initialize
  end

  def get_days(year = DateTime.now.year, month)
		@days = []
    (Date.new(year, 12, 31) << (12-month)).day.times do |day|
      @days << Date.parse(("0#{day+1}/#{month}/#{year}")).strftime('%A %d %B %Y')
    end
    p @days
  end

end