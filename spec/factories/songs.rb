FactoryGirl.define do
  factory :song do
  	sequence(:name) { |n| "song#{n}" }
  end
end