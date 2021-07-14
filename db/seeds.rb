# seeding timeslot table with days from today until 20 days

if Timeslot.all.length == 0
  date = Time.now
  Timeslot.create(date:date, half_day: 1)
  Timeslot.create(date:date, half_day: 2)
  until Timeslot.last.date.year == 5.years.from_now.year
    date = date + 1.day
    Timeslot.create(date: date, half_day: 1)
    Timeslot.create(date: date, half_day: 2)
  end
  puts "added 5 years of dates from today"
end