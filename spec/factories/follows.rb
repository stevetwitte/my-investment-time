FactoryBot.define do
  factory :follow do
    user { create :user }
    invest { create :invest }
  end
end