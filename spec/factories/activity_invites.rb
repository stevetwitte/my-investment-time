FactoryBot.define do
  factory :activity_invite, class: Activity::Invite do
    association :user
    association :team
    status 0
  end
end