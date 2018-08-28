require "rails_helper"

RSpec.describe Activity::Notification, type: :model do
  subject { build :activity_notification }

  it "has a valid factory" do
    expect(build(:activity_notification)).to be_valid
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }

    it { is_expected.to belong_to(:invest) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:status) }
  end
end
