FactoryBot.define do
  factory :timeslot, class: "Timeslot" do
    id {1}
    date {"2021-07-14"}
    half_day {1}
    is_blocked {false}
  end
end