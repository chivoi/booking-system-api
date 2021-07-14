class Timeslot < ApplicationRecord
  enum half_day: {one: 1, two: 2}
end
