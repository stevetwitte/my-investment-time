require 'rails_helper'

RSpec.describe Status, type: :model do
  subject { build :status }

  it 'has a valid factory' do
    expect(build :status).to be_valid
  end

  describe 'associations' do
    it { is_expected.to belong_to(:invest) }

    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title)}
  end
end
