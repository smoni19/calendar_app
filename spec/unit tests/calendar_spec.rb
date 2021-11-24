require 'calendar'

describe '#get_days ' do
  it 'returns an array of days for the month given' do
    subject = Calendar.new
    subject.get_days(2021, 11)
    expect(subject.days).to include("Monday 01 November 2021")
    expect(subject.twoD_day_array).to include(["Tuesday", "30th", "of", "November", 2021])
  end
end
