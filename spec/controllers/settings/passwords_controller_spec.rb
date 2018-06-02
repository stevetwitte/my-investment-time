require 'rails_helper'

RSpec.describe Settings::PasswordsController, type: :controller do

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
      let(:user) { create(:user, password: '123123123') }

      before :each do
        sign_in_as(user)
        patch :update, params: { user: { current_password: '123123123',
                                         new_password: 'newpassword' } }
      end

      it "returns http found" do
        expect(response).to have_http_status :found
      end

      it "updates the users password" do
        expect(user.authenticated?('newpassword')).to eql(true)
      end
    end
  end
end
