class Timeslot < ApplicationRecord
  has_one :booking
  enum half_day: {one: 1, two: 2}

  # search by date and half_day

  def self.search(date, half_day)
    timeslot = Timeslot.find_by(date: date, half_day: half_day)
    if timeslot
      self.where(id: timeslot)
    else
      return nil
    end
  end

end
