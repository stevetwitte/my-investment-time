FactoryBot.define do
  factory :invest do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph(2) }
    user { create(:user) }
    links { { 'homepage': 'https://www.github.com',
              'github': 'https://www.github.com' } }
  end
end
