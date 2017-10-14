FactoryGirl.define do
  factory :billed do
    firstName { Faker::StarWars.character }
    lastName { Faker::StarWars.character }
    done false
    bill_id nil
  end
end
