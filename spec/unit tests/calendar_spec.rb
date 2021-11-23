require 'calendar'

describe '#get_days ' do
  it 'returns an array of days for the month given' do
    subject = Calendar.new
    subject.get_days(2021, 11)
    expect(subject.days).to eq ["Monday 01 November 2021", "Tuesday 02 November 2021", "Wednesday 03 November 2021", "Thursday 04 November 2021", "Friday 05 November 2021", "Saturday 06 November 2021", "Sunday 07 November 2021", "Monday 08 November 2021", "Tuesday 09 November 2021", "Wednesday 10 November 2021", "Thursday 11 November 2021", "Friday 12 November 2021", "Saturday 13 November 2021", "Sunday 14 November 2021", "Monday 15 November 2021", "Tuesday 16 November 2021", "Wednesday 17 November 2021", "Thursday 18 November 2021", "Friday 19 November 2021", "Saturday 20 November 2021", "Sunday 21 November 2021", "Monday 22 November 2021", "Tuesday 23 November 2021", "Wednesday 24 November 2021", "Thursday 25 November 2021", "Friday 26 November 2021", "Saturday 27 November 2021", "Sunday 28 November 2021", "Monday 29 November 2021", "Tuesday 30 November 2021"]
  end
end