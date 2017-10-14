FactoryGirl.define do
  factory :bill do
    title { Faker::Number.number(3) }
    created_by { Faker::Number.number(10) }
  end
end
