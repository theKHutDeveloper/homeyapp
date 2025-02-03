FactoryBot.define do
  factory :status_change do
    new_status { 1 }
    user_name { nil }
    project { nil }
    user { nil }
  end
end
