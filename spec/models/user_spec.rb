require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build :user }

  it 'has a valid factory' do
    expect(build :user).to be_valid
  end

  describe 'associations' do
    it { is_expected.to have_many(:invests) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }

    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

    it { is_expected.to validate_presence_of(:username) }

    it { is_expected.to validate_uniqueness_of(:username).case_insensitive }

    it { is_expected.to validate_presence_of(:password) }

    it { is_expected.to validate_length_of(:password).is_at_least(8) }

    describe 'email' do
      before do
        subject.email = email
      end

      context 'with a bad email address' do
        let(:email) { 'bademail' }

        it { is_expected.to be_invalid }
      end

      context 'with a bad email address containing an ampersand' do
        let(:email) { 'bad@email' }

        it { is_expected.to be_invalid }
      end

      context 'with a good email address' do
        let(:email) { 'bad@email.example.com' }

        it { is_expected.to be_valid }
      end
    end
  end
end
