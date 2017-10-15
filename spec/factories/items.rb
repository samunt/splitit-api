FactoryGirl.define do
  factory :item do
    name { Faker::Number.number(10) }
    cost { Faker::Number.decimal(2) }
    bill_id nil
  end
end
