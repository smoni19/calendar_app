require 'date'
require 'fixnum'

class Calendar

  attr_reader :days

  def initialize
  end

  def get_days(year = DateTime.now.year, month)
		@days = []
    @twoD_day_array = []
    (Date.new(year, 12, 31) << (12-month)).day.times do |date|
      date += 1
      day_string = Date.parse(("0#{date}/#{month}/#{year}")).strftime('%A %d %B %Y')
      @twoD_day_array << [day_string.split.first, date.ordinalize, 'of', day_string.split(' ')[2], year]
      @days << day_string
    end
    @twoD_day_array.each do |date|
      p date.join(' ')
    end
  end
end