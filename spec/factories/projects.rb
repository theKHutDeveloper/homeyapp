FactoryBot.define do
  factory :project do
    title { "Project 1" }
    description { "An abstract project" }
    status { 0 }
    user { nil }
    user_name { nil }
  end
end
