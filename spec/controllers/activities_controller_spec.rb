require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do

  describe "GET #index" do
    let!(:user) { create :user }
    let!(:owner) { create :user }
    let!(:team) { create :team }

    before :each do
      create :activity_invite, team: team, user: user, member_email: user.email

      sign_in_as user
      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status :ok
    end

    it "returns matching invitations instance variable" do
      expect(assigns(:invitations).length).to be 1
    end
  end

end
