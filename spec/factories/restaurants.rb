FactoryGirl.define do
  factory :restaurant do
    name { FFaker::Lorem.word }
    last_visit { Date.today }
  end
end