FactoryBot.define do
  factory :like do
    user { create(:user) }
    invest { create(:invest) }
  end
end
