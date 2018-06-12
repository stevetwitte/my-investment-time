FactoryBot.define do
  factory :status do
    title { Faker::Lorem.word }
    detail { Faker::Lorem.sentence }
    association :user
    association :invest
  end
end