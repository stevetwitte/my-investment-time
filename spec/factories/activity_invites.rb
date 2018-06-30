FactoryBot.define do
  factory :activity_invite, class: Activity::Invite do
    association :user
    association :team
    member_email { Faker::Internet.email }
    status 0
  end
end