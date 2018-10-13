FactoryBot.define do
  factory :team do
    name { Faker::Company.name }
    slug { Faker::Internet.user_name }
    owner { create :user }
  end
end
