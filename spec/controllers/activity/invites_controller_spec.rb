require 'rails_helper'

RSpec.describe Activities::InvitesController, type: :controller do

  describe "GET #new" do
    let!(:user) { create :user }
    let!(:team) { create :team, owner: user }

    before :each do
      sign_in_as user
      get :new, params: { team_id: team.slug }
    end

    it "returns http ok" do
      expect(response).to have_http_status :ok
    end

    it "has an instance variable of a new team" do
      expect(assigns(:invite)).to be_a_new Activity::Invite
    end
  end

  describe "POST #create" do
    let!(:user) { create :user }
    let!(:member) { create :user }
    let!(:team) { create :team, owner: user }

    before :each do
      sign_in_as user
      post :create, params: { team_id: team.slug,
                              activity_invite: { member_email: member.email } }
    end

    it "returns http found" do
      expect(response).to have_http_status :found
    end

    it "redirects to the team invite url" do
      expect(response).to redirect_to new_team_invite_url team
    end

    it "creates an Activity::Invite" do
      expect(Activity::Invite.all.length).to eql 1
    end

    it "associates the user" do
      expect(Activity::Invite.last.user).to be_valid
    end
  end

  describe "DELETE #destroy" do
    let!(:user) { create :user }
    let!(:member) { create :user }
    let!(:team) { create :team, owner: user }
    let!(:activity_invite) { create :activity_invite, team: team, user: member, member_email: member.email }

    before :each do
      sign_in_as user
      delete :destroy, params: { team_id: team.slug, id: activity_invite.id }
    end

    it "returns http found" do
      expect(response).to have_http_status :found
    end

    it "redirects to the team invite url" do
      expect(response).to redirect_to new_team_invite_url team
    end

    it "destroys the Activity::Invite" do
      expect(Activity::Invite.all.length).to eql 0
    end
  end
end