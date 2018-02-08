FactoryBot.define do
  factory :artist do
    sequence(:name) { |n| "artist#{n}" }

    factory :invalid_artist do
      name nil
    end
  end
end
