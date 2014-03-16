FactoryGirl.define do
  factory :song do
  	sequence(:name) { |n| "song#{n}" }

    factory :song_with_artist do
      sequence(:artist_name) { |n| "artist#{n}"}
    end
  end
end