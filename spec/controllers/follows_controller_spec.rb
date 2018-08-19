require "rails_helper"

RSpec.describe FollowsController, type: :controller do
  describe "POST #create" do
    context "as a user that is not already following the invest" do
      let(:invest) { create :invest }
      let(:user) { create :user }

      before :each do
        sign_in_as(user)
        post :create, params: { invest_id: invest }
      end

      it "returns http ok" do
        expect(response).to have_http_status :ok
      end

      it "user following_invests includes the invest" do
        expect(user.following_invests).to include(invest)
      end
    end

    context "as a user that was already following the invest" do
      let(:invest) { create :invest }
      let(:user) { create :user }

      before :each do
        create(:follow, user: user, invest: invest)
        sign_in_as(user)
        post :create, params: { invest_id: invest }
      end

      it "returns http ok" do
        expect(response).to have_http_status :ok
      end

      it "removes a like to the invest" do
        expect(user.following_invests).not_to include(invest)
      end
    end
  end
end
