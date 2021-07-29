class Booking < ApplicationRecord
  belongs_to :timeslot
  belongs_to :user
  enum event_type: {wedding: 1, party: 2, reception: 3, corporate: 4, festival: 5, other: 6}
end
