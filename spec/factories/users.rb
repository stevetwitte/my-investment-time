FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    username { Faker::Internet.user_name }
    password "password"

    after(:build) do |user|
      build(:profile, user: user)
    end
  end
end