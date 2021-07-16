class Timeslot < ApplicationRecord
  has_one :booking
  enum half_day: {one: 1, two: 2}
end
