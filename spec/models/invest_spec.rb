require 'rails_helper'

RSpec.describe Invest, type: :model do
  subject { build :invest }

  it 'has a valid factory' do
    expect(build :invest).to be_valid
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }

    it { is_expected.to have_many(:tags) }

    it { is_expected.to have_many(:statuses) }

    it { is_expected.to have_many(:likes) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title)}

    it { is_expected.to validate_presence_of(:body)}
  end
end
