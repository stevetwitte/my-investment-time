require "rails_helper"

RSpec.describe User, type: :model do
  subject { build :user }

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  describe "associations" do
    it { is_expected.to have_many(:invests) }

    it { is_expected.to have_one(:profile) }

    it { is_expected.to have_many(:statuses) }

    it { is_expected.to have_many(:likes) }

    it { is_expected.to have_many(:teams) }

    it { is_expected.to have_many(:activity_invites) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }

    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

    it { is_expected.to validate_presence_of(:username) }

    it { is_expected.to validate_uniqueness_of(:username).case_insensitive }

    it { is_expected.to validate_presence_of(:password) }

    it { is_expected.to validate_length_of(:password).is_at_least(8) }

    describe "email" do
      before do
        subject.email = email
      end

      context "with a bad email address" do
        let(:email) { "bademail" }

        it { is_expected.to be_invalid }
      end

      context "with a bad email address containing an ampersand" do
        let(:email) { "bad@email" }

        it { is_expected.to be_invalid }
      end

      context "with a good email address" do
        let(:email) { "good@email.com" }

        it { is_expected.to be_valid }
      end
    end
  end

  describe "callback methods" do
    context "after create" do
      it "is expected to create a blank profile" do
        user = create(:user)

        expect(user.profile).to be_valid
      end
    end

    context "before save" do
      it "is expected to downcase email and username" do
        user = create(:user, email: "TestCase@EmailAddress.com", username: "MyUserName")

        expect(user.email).to eql("testcase@emailaddress.com")
        expect(user.username).to eql("myusername")
      end
    end
  end

  describe "notifications" do
    context "the user has no invites" do
      it "is expected to return empty relation" do
        expect(subject.notifications).to be_empty
      end
    end

    context "the user has no invites" do
      let!(:user) { create :user }
      let!(:team) { create :team }
      let!(:invite) do
        Activity::Invite.create(team: team,
                                member_email: user.email,
                                user: user)
      end

      it "is expected to return invites" do
        expect(user.notifications).to include(invite)
      end
    end
  end
end
