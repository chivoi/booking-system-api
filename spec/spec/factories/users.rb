FactoryBot.define do
  factory :user, class: "User" do
    id {1}
    first_name {"Vladimir"}
    last_name {"Konev"}
    phone_num {1298694393}
    email {"papa@test.com"}
    is_admin {false}
    password {"iampapa"}
    password_confirmation {"iampapa"}
  end
end