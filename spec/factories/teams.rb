FactoryBot.define do
  factory :team do
    name { Faker::Company.name }
    slug { Faker::Company.name.strip().downcase.gsub(' ', '-') }
    owner { create :user }
  end
end