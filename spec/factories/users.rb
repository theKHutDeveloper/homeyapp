FactoryBot.define do
  factory :user do
    name { "Joe Bloggs" }
    email { "joe_bloggs@example.com" }
    password_digest { "pa5sw03d" }
  end
end
