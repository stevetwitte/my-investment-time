FactoryBot.define do
  factory :profile do
    full_name { Faker::Name.name }
    bio { Faker::Lorem.paragraph }
    links { { 'homepage': 'https://www.github.com',
              'github': 'https://www.github.com' } }
    user { build(:user) }
  end
end