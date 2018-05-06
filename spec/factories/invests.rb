FactoryBot.define do
  factory :invest do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph(2) }
    user { create(:user) }
  end
end
