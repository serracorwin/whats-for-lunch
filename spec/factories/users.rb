FactoryGirl.define do
  factory :user do
    email Ffaker::Internet.email
    password "changeme"
    password_confirmation "changeme"
  end
end