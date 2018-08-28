require "rails_helper"

RSpec.describe LikesController, type: :controller do
  describe "POST #create" do
    context "as a user that has not already liked the invest" do
      let(:invest) { create :invest }
      let(:user) { create :user }

      before :each do
        sign_in_as(user)
        post :create, params: { invest_id: invest }
      end

      it "returns http ok" do
        expect(response).to have_http_status :ok
      end

      it "adds a like to the invest" do
        expect(invest.likes.length).to eql(1)
      end
    end

    context "as a user that has already liked the invest" do
      let(:invest) { create :invest }
      let(:user) { create :user }

      before :each do
        create(:like, user: user, invest: invest)
        sign_in_as(user)
        post :create, params: { invest_id: invest }
      end

      it "returns http ok" do
        expect(response).to have_http_status :ok
      end

      it "removes a like to the invest" do
        expect(invest.likes.length).to eql(0)
      end
    end
  end
end
