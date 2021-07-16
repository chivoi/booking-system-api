# seeding timeslot table with days from today until 20 days

if Timeslot.all.length == 0
  date = Date.current
  Timeslot.create(date:date, half_day: 1)
  Timeslot.create(date:date, half_day: 2)
  until Timeslot.last.date.year == 5.years.from_now.year
    date = date + 1.day
    Timeslot.create(date: date, half_day: 1)
    Timeslot.create(date: date, half_day: 2)
  end
  puts "added 5 years of dates from today"
end

# seeding users
if User.all.length == 0
  User.create(first_name:"Ana", last_name: "Lastoviria", phone_num: "0404040404", email: "ana@test.com", password:"password", password_confirmation:"password")
  User.create(first_name:"Alex", last_name: "Velasco", phone_num: "123456789", email: "alex@test.com", password:"password1", password_confirmation:"password1", is_admin: "true")
  puts "Created 1 x user + 1 x admin"
end