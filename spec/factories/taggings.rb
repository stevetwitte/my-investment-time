FactoryBot.define do
  factory :tagging do
    association :invest, factory: :invest
    association :tag, factory: :tag
  end
end