require "rails_helper"

RSpec.describe Settings::AccountsController, type: :controller do

  describe "GET #edit" do
    context "when signed in" do
      before :each do
        sign_in
        get :edit
      end

      it "returns http success" do
        expect(response).to have_http_status :ok
      end

      it "returns user instance variable" do
        expect(assigns(:user)).to be_valid
      end
    end

    context "when not signed in" do
      before :each do
        get :edit
      end

      it "returns http found" do
        expect(response).to have_http_status :found
      end

      it "redirects to home" do
        expect(subject).to redirect_to(sign_in_url)
      end
    end
  end

  describe "PATCH #update" do
    context "when signed in" do
      let(:user) { create(:user) }

      before :each do
        sign_in_as(user)
        patch :update, params: { user: { email: "newemail@address.com",
                                         username: "newusername" } }
      end

      it "returns http found" do
        expect(response).to have_http_status :found
      end

      it "updates the users email and username" do
        expect(user.email).to eql "newemail@address.com"
        expect(user.username).to eql "newusername"
      end
    end
  end
end
