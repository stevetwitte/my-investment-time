require 'rails_helper'

RSpec.describe Settings::ProfilesController, type: :controller do

  describe "GET #edit" do
    context "when signed in" do
      before :each do
        sign_in
        get :edit
      end

      it "returns http success" do
        expect(response).to have_http_status :ok
      end

      it "returns profile instance variable" do
        expect(assigns(:profile)).to be_valid
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
        patch :update, params: { profile: { full_name: 'new name',
                                            bio: 'new biography',
                                            links: { github: 'https://www.github.com' } } }
      end

      it "returns http found" do
        expect(response).to have_http_status :found
      end

      it "updates the users profile" do
        expect(user.profile.full_name).to eql 'new name'
        expect(user.profile.bio).to eql 'new biography'
        expect(user.profile.links).to eql({ 'github' => 'https://www.github.com' })
      end
    end
  end
end
