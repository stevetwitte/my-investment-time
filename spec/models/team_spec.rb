require 'rails_helper'

RSpec.describe Team, type: :model do
  subject { build :team }

  it 'has a valid factory' do
    expect(build(:team)).to be_valid
  end

  describe 'associations' do
    it { is_expected.to belong_to :owner }

    it { is_expected.to have_many :members }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }

    it { is_expected.to validate_presence_of :slug }

    it { is_expected.to validate_uniqueness_of :slug }
  end

end
