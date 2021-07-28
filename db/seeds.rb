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
  User.create(first_name:"Regular", last_name: "User", phone_num: "0404040404", email: "user@test.com", password:"iamuser", password_confirmation:"iamuser")
  User.create(first_name:"Admin", last_name: "Admin", phone_num: "123456789", email: "admin@test.com", password:"iamadmin", password_confirmation:"iamadmin", is_admin: true)
  puts "Created 1 x user + 1 x admin"
end