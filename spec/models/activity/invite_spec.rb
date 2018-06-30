require 'rails_helper'

RSpec.describe Activity::Invite, type: :model do
  subject { build :activity_invite }

  it 'has a valid factory' do
    expect(build(:activity_invite)).to be_valid
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }

    it { is_expected.to belong_to(:team) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:status) }
  end
end
