FactoryBot.define do
  factory :comment do
    content { "This is the content of my comment" }
    user_name { nil }
    project { nil }
    user { nil }
  end
end
