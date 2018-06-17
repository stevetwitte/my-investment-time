require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { build :like }

  it 'has a valid factory' do
    expect(build :like).to be_valid
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user) }

    it { is_expected.to validate_presence_of(:invest) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }

    it { is_expected.to belong_to(:invest) }
  end
end
