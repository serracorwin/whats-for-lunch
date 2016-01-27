FactoryGirl.define do
  factory :rating do
    value { Random.rand(4) + 1 }
    association :user
    association :restaurant
  end
end