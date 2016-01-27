FactoryGirl.define do
  factory :restaurant do
    name Ffaker::Lorem.words
    last_visit Date.today
  end
end