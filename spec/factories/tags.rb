FactoryBot.define do
  factory :tag do
    name { Faker::Lorem.word }

    after(:create) do |tag|
      tag.invests << create(:invest)
    end
  end
end