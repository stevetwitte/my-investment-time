require 'rails_helper'

RSpec.describe Invest, type: :model do
  subject { build :invest }

  it 'has a valid factory' do
    expect(build :invest).to be_valid
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title)}

    it { is_expected.to validate_presence_of(:body)}
  end
end
