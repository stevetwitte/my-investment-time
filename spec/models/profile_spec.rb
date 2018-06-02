require 'rails_helper'

RSpec.describe Profile, type: :model do
  subject { build :profile }

  it 'has a valid factory' do
    expect(build :profile).to be_valid
  end

  describe 'associations' do
    it { is_expected.to belong_to :user }
  end
end
