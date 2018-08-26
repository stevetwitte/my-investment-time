FactoryBot.define do
  factory :activity_notification, class: Activity::Notification do
    association :user
    association :invest
    status 0
  end
end
