require 'rails_helper'

RSpec.describe TeamsController, type: :controller do

  describe "GET #index" do
    let!(:user) { create :user }
    let!(:team_owned) { create :team, owner: user }

    before :each do
      10.times do
        create :team
      end

      user.teams << Team.last

      sign_in_as(user)
      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status :ok
    end

    it "returns owned teams in instance variable" do
      expect(assigns(:owned_teams).length).to be 1
    end

    it "returns joined teams in instance variable" do
      expect(assigns(:member_teams).length).to be 1
    end
  end

  describe "GET #show" do
    before :each do
      10.times do
        create :team
      end

      sign_in
      get :show, params: { id: Team.last.id }
    end

    it "returns http success" do
      expect(response).to have_http_status :ok
    end

    it "returns team in instance variable" do
      expect(assigns(:team)).to be_valid
    end
  end

  describe "GET #new" do
    before :each do
      sign_in
      get :new
    end

    it "returns http ok" do
      expect(response).to have_http_status :ok
    end

    it "has an instance variable of a new team" do
      expect(assigns(:team)).to be_a_new Team
    end
  end

  describe "POST #create" do
    let!(:user) { create :user }

    before :each do
      sign_in_as user
      post :create, params: { team: FactoryBot.attributes_for(:team) }
    end

    it "returns http found" do
      expect(response).to have_http_status :found
    end

    it "redirects to the team url" do
      expect(response).to redirect_to team_url Team.last
    end

    it "creates a Team" do
      expect(Team.all.length).to eql 1
    end

    it "associates the owner" do
      expect(Team.last.owner).to eql user
    end
  end

  describe "GET #edit" do
    let!(:user) { create :user }
    let!(:team) { create :team, owner: user }

    before :each do
      10.times do
        create :team
      end

      sign_in_as(user)
      get :edit, params: { id: team.id }
    end

    it "returns http success" do
      expect(response).to have_http_status :ok
    end

    it "has an instance variable of the team" do
      expect(assigns(:team)).to eql team
    end
  end

  describe "PATCH #update" do
    context "when team owner" do
      let!(:user) { create :user }
      let!(:team) { create :team, owner: user }

      before :each do
        sign_in_as(user)
        patch :update, params: { id: team.id,
                                 team: { description: "This is a test description." } }
      end

      it "returns http found" do
        expect(response).to have_http_status :found
      end

      it "redirects to the team url" do
        expect(response).to redirect_to team_url Team.last
      end

      it "updates the team" do
        expect(Team.find(team.id).description).to eql "This is a test description."
      end
    end
  end
end
