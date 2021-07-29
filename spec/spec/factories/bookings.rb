FactoryBot.define do
  factory :booking, class: "Booking" do
    id {1}
    association :timeslot, factory: :timeslot
    association :user, factory: :user
    venue {"Ermelerhaus"}
    address {"41 Alma rd, St Kilda East"}
    event_type {3}
    start_time {"12:00pm"}
    duration {45}
    pa_provided {true}
    message {"This is a factory message?"}
  end
end