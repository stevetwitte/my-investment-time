require "rails_helper"

RSpec.describe Follow, type: :model do
  subject { build :follow }

  it "has a valid factory" do
    expect(build(:follow)).to be_valid
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }

    it { is_expected.to belong_to(:invest) }
  end
end
