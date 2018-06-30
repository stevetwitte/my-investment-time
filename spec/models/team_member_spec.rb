require 'rails_helper'

RSpec.describe TeamMember, type: :model do
  subject { build :team_member }
  
  it 'has a valid factory' do
    expect(build :team_member).to be_valid
  end

  describe 'associations' do
    it { is_expected.to belong_to(:team) }

    it { is_expected.to belong_to(:user) }
  end
end
